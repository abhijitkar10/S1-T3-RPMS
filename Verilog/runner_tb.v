module step_calculator_tb;

    reg clk;
    reg rst;
    reg [7:0] hr_input;
    reg [1:0] steps_per_second;
    reg [7:0] stride_length;
    reg valid_input;
    wire [15:0] total_steps;
    wire [31:0] total_distance;
    wire [7:0] time_elapsed;
    wire [1:0] heart_rate_classification;
    wire [7:0] max_heart_rate;
    wire [31:0] total_calories;
    wire [31:0] average_heart_rate;
    wire [1:0] workout_intensity;
    real speed;  // Speed will be calculated at the end of the simulation in cm/s

    // Instantiate the StepCalculatorDataflow module
    StepCalculatorDataflow uut (
        .clk(clk),
        .rst(rst),
        .hr_input(hr_input),
        .steps_per_second(steps_per_second),
        .stride_length(stride_length),
        .valid_input(valid_input),
        .total_steps(total_steps),
        .total_distance(total_distance),
        .time_elapsed(time_elapsed),
        .heart_rate_classification(heart_rate_classification),
        .max_heart_rate(max_heart_rate),
        .total_calories(total_calories),
        .average_heart_rate(average_heart_rate),
        .workout_intensity(workout_intensity)
    );

    // Clock signal generation
    always #5 clk = ~clk;  // 100 MHz clock, period = 10 time units

    // Function to convert classification to text for display
    function [8*10:0] classification_to_text;
        input [1:0] classification;
        begin
            case (classification)
                2'b00: classification_to_text = "Safe";
                2'b01: classification_to_text = "Warning";
                2'b10: classification_to_text = "Emergency";
                default: classification_to_text = "Unknown";
            endcase
        end
    endfunction

    // Function to convert workout intensity to text
    function [8*20:0] workout_intensity_to_text;
        input [1:0] intensity;
        begin
            case (intensity)
                2'b00: workout_intensity_to_text = "Warmup";
                2'b01: workout_intensity_to_text = "Fat Burn";
                2'b10: workout_intensity_to_text = "Intense Cardio";
                default: workout_intensity_to_text = "Unknown Intensity";
            endcase
        end
    endfunction

    integer i;  // Loop counter
    reg direction_hr;  // To keep track of heart rate increment or decrement
    reg [2:0] step_pattern_index;  // Step pattern index to cycle through 1 2 3 4 3 2 1

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        hr_input = 100;
        valid_input = 0;
        stride_length = 75;  // Set stride length to 75 cm
        direction_hr = 1;  // Start with heart rate incrementing
        step_pattern_index = 0;  // Start with the first pattern index

        // Reset the system
        #10;
        rst = 0;

        // Loop through 20 cycles of incrementing and decrementing heart rate and steps
        for (i = 0; i < 20; i = i + 1) begin
            #10;
            // Adjust heart rate incrementally
            if (direction_hr) begin
                hr_input = hr_input + 10;
                if (hr_input >= 200) direction_hr = 0;  // Start decrementing after reaching 200
            end else begin
                hr_input = hr_input - 10;
                if (hr_input <= 100) direction_hr = 1;  // Start incrementing after reaching 100
            end

            // Steps per second pattern: 1 2 3 4 3 2 1
            case (step_pattern_index)
                0: steps_per_second = 1;
                1: steps_per_second = 2;
                2: steps_per_second = 3;
                3: steps_per_second = 4;
                4: steps_per_second = 3;
                5: steps_per_second = 2;
                6: steps_per_second = 1;
            endcase

            // Move to the next step pattern
            step_pattern_index = step_pattern_index + 1;
            if (step_pattern_index > 6)
                step_pattern_index = 0;  // Loop back to start of the pattern

            valid_input = 1;
            
            #5;  // Wait for the input to be processed

            // Display relevant results for each cycle
            $display("Heart Rate: %d, Steps Per Second: %d", hr_input, steps_per_second);
            $display("Heart Rate Classification: %s", classification_to_text(heart_rate_classification));
            $display("Total Steps: %d", total_steps);
            $display("Total Distance: %d cm", total_distance);
            $display("Time Elapsed: %d seconds", time_elapsed);
            $display("Max Heart Rate: %d", max_heart_rate);
            $display("Total Calories: %d", total_calories);
            $display("Average Heart Rate: %d", average_heart_rate);
            $display("-----------------------------");
            
            #5; valid_input = 0;  // Deactivate valid input for the next cycle
        end

        // Calculate speed (distance in cm / time in seconds) after the loop ends
        if (time_elapsed > 0) begin
            speed = total_distance / time_elapsed;
        end else begin
            speed = 0;
        end

        // Final results
        $display("Final Results:");
        $display("Total Steps: %d", total_steps);
        $display("Total Distance: %d cm", total_distance);
        $display("Time Elapsed: %d seconds", time_elapsed);
        $display("Max Heart Rate: %d", max_heart_rate);
        $display("Total Calories: %d", total_calories);
        $display("Average Heart Rate: %d", average_heart_rate);
        $display("Speed: %f cm/s", speed);
        $display("Workout Intensity: %s", workout_intensity_to_text(workout_intensity));

        // Stop the simulation
        $finish;
    end
endmodule
