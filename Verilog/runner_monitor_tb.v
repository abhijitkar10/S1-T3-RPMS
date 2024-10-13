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
    real speed;  // Variable to store speed (in meters per second)

    // Instantiate the StepCalculator module
    StepCalculator uut (
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
        .max_heart_rate(max_heart_rate)
    );

    // Generate clock signal (adjusted to simulate 1 second per valid input)
    always #5 clk = ~clk;  // 100 MHz clock, period = 10 time units

    // Function to convert classification to text
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

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        hr_input = 0;
        valid_input = 0;
        steps_per_second = 0;
        stride_length = 75;  // Set stride length to 75 cm
        
        // Reset the system
        #10;
        rst = 0;

        // Provide 20 heart rate inputs (between 100 and 200) and steps per second (0 to 3)
        repeat (20) begin
            #10; hr_input = $urandom_range(100, 200);  // Random heart rate between 100 and 200
            steps_per_second = $urandom_range(0, 3);   // Random steps between 0 and 3
            valid_input = 1;
            #5; $display("Heart Rate: %d, Steps Per Second: %d, Classification: %s", hr_input, steps_per_second, classification_to_text(heart_rate_classification));
            #5; valid_input = 0;  // Deactivate valid input for the next clock cycle
        end

        // Wait for the calculation to complete
        #20;
        
        // Calculate speed (distance in meters / time in seconds)
        if (time_elapsed > 0) begin
            speed = (total_distance / 100.0) / time_elapsed;
        end else begin
            speed = 0;
        end

        // Display final results
        $display("Final Results:");
        $display("Total Steps: %d", total_steps);
        $display("Total Distance: %d cm", total_distance);
        $display("Time Elapsed: %d seconds", time_elapsed);
        $display("Speed: %f m/s", speed);
        $display("Max Heart Rate: %d", max_heart_rate);

        // Stop the simulation
        $finish;
    end
endmodule
