module step_comparison_tb;

    reg clk;
    reg rst;
    reg [7:0] hr_input_1, hr_input_2;
    reg [2:0] steps_per_second_1, steps_per_second_2;  
    reg valid_input_1, valid_input_2;
    wire [15:0] total_steps_1, total_steps_2;
    wire [31:0] total_distance_1, total_distance_2;
    wire [7:0] time_elapsed_1, time_elapsed_2;
    wire [1:0] heart_rate_classification_1, heart_rate_classification_2;
    wire [7:0] max_heart_rate_1, max_heart_rate_2;
    wire [31:0] total_calories_1, total_calories_2;
    wire [31:0] average_heart_rate_1, average_heart_rate_2;
    wire [1:0] workout_intensity_1, workout_intensity_2;
    wire [15:0] speed_1, speed_2;
    wire [1:0] hr_comparison;
    wire step_feedback;
    reg [7:0] stride_length_1 = 8'b01001011;  // 75 in decimal
    reg [7:0] stride_length_2 = 8'b01001011;  // 75 in decimal

    reg direction_hr_1;  // Direction control for Run 1 (increment/decrement)
    reg direction_hr_2;  // Direction control for Run 2 (increment/decrement)
    reg direction_steps_1;  // Direction control for steps per second (Run 1)
    reg direction_steps_2;  // Direction control for steps per second (Run 2)

    // Instantiate two step calculators for each run
    StepCalculatorDataflow step_calculator_1 (
        .clk(clk),
        .rst(rst),
        .hr_input(hr_input_1),
        .steps_per_second(steps_per_second_1),
        .stride_length(stride_length_1),
        .valid_input(valid_input_1),
        .total_steps(total_steps_1),
        .total_distance(total_distance_1),
        .time_elapsed(time_elapsed_1),
        .heart_rate_classification(heart_rate_classification_1),
        .max_heart_rate(max_heart_rate_1),
        .total_calories(total_calories_1),
        .average_heart_rate(average_heart_rate_1),
        .workout_intensity(workout_intensity_1),
        .speed(speed_1)
    );

    StepCalculatorDataflow step_calculator_2 (
        .clk(clk),
        .rst(rst),
        .hr_input(hr_input_2),
        .steps_per_second(steps_per_second_2),
        .stride_length(stride_length_2),
        .valid_input(valid_input_2),
        .total_steps(total_steps_2),
        .total_distance(total_distance_2),
        .time_elapsed(time_elapsed_2),
        .heart_rate_classification(heart_rate_classification_2),
        .max_heart_rate(max_heart_rate_2),
        .total_calories(total_calories_2),
        .average_heart_rate(average_heart_rate_2),
        .workout_intensity(workout_intensity_2),
        .speed(speed_2)
    );

    // Instantiate the comparator
    HeartRateAndStepComparator comparator (
        .hr_input(hr_input_2),
        .previous_hr(hr_input_1),
        .steps_input(steps_per_second_2),
        .previous_steps(steps_per_second_1),
        .hr_comparison(hr_comparison),
        .step_feedback(step_feedback)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        valid_input_1 = 0;
        valid_input_2 = 0;
        stride_length_1 = 75;
        stride_length_2 = 75;
        hr_input_1 = 110;  // Changed from 121 to 110
        hr_input_2 = 88;  // Changed from 96 to 88
        steps_per_second_1 = 0; // Start at 2 instead of 1
        steps_per_second_2 = 0; // Start at 2 instead of 1
        direction_hr_1 = 1; // Start incrementing for Run 1
        direction_hr_2 = 1; // Start incrementing for Run 2
        direction_steps_1 = 1; // Start incrementing steps for Run 1
        direction_steps_2 = 1; // Start incrementing steps for Run 2

        // Reset the system
        #10 rst = 0;

        // Simulate for 20 cycles
        repeat (20) begin
            #10;
            // Update heart rate for Run 1 (increments/decrements by 11)
            if (direction_hr_1) begin
                hr_input_1 = hr_input_1 + 11;
                if (hr_input_1 >= 198) direction_hr_1 = 0; // Start decrementing at 198
            end else begin
                hr_input_1 = hr_input_1 - 11;
                if (hr_input_1 <= 121) direction_hr_1 = 1; // Start incrementing at 121
            end

            // Update heart rate for Run 2 (increments/decrements by 8)
            if (direction_hr_2) begin
                hr_input_2 = hr_input_2 + 8;
                if (hr_input_2 >= 152) direction_hr_2 = 0; // Start decrementing at 152
            end else begin
                hr_input_2 = hr_input_2 - 8;
                if (hr_input_2 <= 96) direction_hr_2 = 1; // Start incrementing at 96
            end

            // Steps per second pattern for Run 1: 2 → 3 → 4 → 5 → 4 → 3 → 2
            if (direction_steps_1) begin
                steps_per_second_1 = steps_per_second_1 + 1;
                if (steps_per_second_1 == 4) direction_steps_1 = 0; // Start decrementing at 5
            end else begin
                steps_per_second_1 = steps_per_second_1 - 1;
                if (steps_per_second_1 == 1) direction_steps_1 = 1; // Start incrementing at 2
            end

            // Steps per second pattern for Run 2: 2 → 3 → 4 → 5 → 4 → 3 → 2
            if (direction_steps_2) begin
                steps_per_second_2 = steps_per_second_2 + 1;
                if (steps_per_second_2 == 4) direction_steps_2 = 0; // Start decrementing at 5
            end else begin
                steps_per_second_2 = steps_per_second_2 - 1;
                if (steps_per_second_2 == 1) direction_steps_2 = 1; // Start incrementing at 2
            end

            valid_input_1 = 1;
            valid_input_2 = 1;

            #10;
            valid_input_1 = 0;
            valid_input_2 = 0;

            // Print heart rate comparison and step feedback
            $display("HR Run 1: %d, HR Run 2: %d, Comparison: %s", hr_input_1, hr_input_2, (hr_comparison == 2'b01) ? "Higher" : (hr_comparison == 2'b10) ? "Lower" : "Same");
            $display("Steps Run 1: %d, Steps Run 2: %d, Feedback: %s", steps_per_second_1, steps_per_second_2, (step_feedback ? "Good" : "Go Faster"));
        end

        // Display Final Results for Run 1
        $display("Final Results for Run 1:");
        $display("Total Steps: %d", total_steps_1);
        $display("Total Distance: %d cm", total_distance_1);
        $display("Time Elapsed: %d seconds", time_elapsed_1);
        $display("Max Heart Rate: %d", max_heart_rate_1);
        $display("Total Calories: %d", total_calories_1);
        $display("Average Heart Rate: %d", average_heart_rate_1);
        $display("Speed: %f cm/s", speed_1);

        // Display Final Results for Run 2
        $display("Final Results for Run 2:");
        $display("Total Steps: %d", total_steps_2);
        $display("Total Distance: %d cm", total_distance_2);
        $display("Time Elapsed: %d seconds", time_elapsed_2);
        $display("Max Heart Rate: %d", max_heart_rate_2);
        $display("Total Calories: %d", total_calories_2);
        $display("Average Heart Rate: %d", average_heart_rate_2);
        $display("Speed: %f cm/s", speed_2);

        // End simulation
        $finish;
    end

endmodule
