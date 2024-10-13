// 1-bit Full Adder using gate-level logic
module FullAdderGateLevel (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    wire axorb, a_and_b, axorb_and_cin;

    // XOR gate for sum calculation (a ^ b ^ cin)
    xor (axorb, a, b);         // a ^ b
    xor (sum, axorb, cin);     // sum = (a ^ b) ^ cin

    // AND gates for carry calculation
    and (a_and_b, a, b);                  // a & b
    and (axorb_and_cin, axorb, cin);      // (a ^ b) & cin

    // OR gate for carry out
    or (cout, a_and_b, axorb_and_cin);    // cout = (a & b) | ((a ^ b) & cin)
    
endmodule

// 32-bit Adder using gate-level Full Adders
module LogicalAdderGateLevel (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [31:0] carry;  // Wire for carrying the carry-out to the next stage

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin: full_adder_chain
            if (i == 0) begin
                // First bit (LSB), no carry-in
                FullAdderGateLevel fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(1'b0),  // Carry-in is 0 for the first full adder
                    .sum(sum[i]),
                    .cout(carry[i])
                );
            end else begin
                // Remaining bits, carry-in from previous stage
                FullAdderGateLevel fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(carry[i-1]),  // Carry-in from the previous full adder
                    .sum(sum[i]),
                    .cout(carry[i])
                );
            end
        end
    endgenerate
endmodule

// 32-bit Multiplier using gate-level logic
module GateLevelMultiplier (
    input [31:0] A,    // 32-bit multiplicand
    input [31:0] B,    // 32-bit multiplier
    output [31:0] Product // 32-bit product
);
    wire [31:0] partial_product[31:0]; // Partial products
    wire [31:0] sum[31:0];  // Sum of partial products
    wire [31:0] carry[31:0]; // Carry wires for each addition stage

    genvar i, j;

    // Step 1: Generate partial products using AND gates
    generate
        for (i = 0; i < 32; i = i + 1) begin: partial_product_generation
            for (j = 0; j < 32; j = j + 1) begin: generate_partial_products
                and (partial_product[i][j], A[j], B[i]);  // AND gate for each bit
            end
        end
    endgenerate

    // Step 2: Sum the partial products using Full Adders (gate-level)
    // Initialize the first row of sums
    assign sum[0] = partial_product[0]; // No need for zero padding, as we're only using 32 bits

    // Loop through all the partial products and sum them using Full Adders
    generate
        for (i = 1; i < 32; i = i + 1) begin: summation_loop
            LogicalAdderGateLevel adder (
                .a(partial_product[i][31:0]),  // Only pass the lower 32 bits
                .b(sum[i-1][31:0]),  // Only pass the lower 32 bits from previous sum
                .sum(sum[i][31:0])   // Output the lower 32 bits
            );
        end
    endgenerate

    assign Product = sum[31];  // Final product output
endmodule

// Comparator for heart rate classification
module HeartRateComparator (
    input [7:0] hr_input,
    output reg [1:0] hr_classification
);
    always @(*) begin
        if (hr_input <= 150)
            hr_classification = 2'b00;  // Safe
        else if (hr_input <= 180)
            hr_classification = 2'b01;  // Warning
        else
            hr_classification = 2'b10;  // Emergency
    end
endmodule

// Workout Intensity Comparator based on average heart rate
module WorkoutIntensityComparator (
    input [31:0] avg_heart_rate,
    output reg [1:0] workout_intensity
);
    parameter WARMUP = 2'b00, FAT_BURN = 2'b01, INTENSE_CARDIO = 2'b10;

    always @(*) begin
        if (avg_heart_rate < 120)
            workout_intensity = WARMUP;
        else if (avg_heart_rate >= 120 && avg_heart_rate <= 160)
            workout_intensity = FAT_BURN;
        else
            workout_intensity = INTENSE_CARDIO;
    end
endmodule

// Step Calculator Module
module StepCalculator (
    input wire clk,
    input wire rst,
    input wire [7:0] hr_input,
    input wire [1:0] steps_per_second,
    input wire [7:0] stride_length,
    input wire valid_input,
    output reg [15:0] total_steps,
    output reg [31:0] total_distance,
    output reg [31:0] distance_per_second,
    output reg [7:0] time_elapsed,
    output wire [1:0] heart_rate_classification,
    output reg [7:0] max_heart_rate,
    output reg [31:0] total_calories,
    output reg [31:0] average_heart_rate,
    output wire [1:0] workout_intensity
);

    reg [31:0] heart_rate_sum;
    reg [7:0] heart_rate_count;
    reg [7:0] time_counter;
    wire [31:0] distance_this_second;
    wire [31:0] calories_this_second;

    parameter CALORIE_FACTOR = 32'd50;

    // Gate-level multiplier instances for calculations
    GateLevelMultiplier distance_multiplier (
        .A({30'b0, steps_per_second}),
        .B({24'b0, stride_length}),
        .Product(distance_this_second)  // Ensure 32 bits
    );

    GateLevelMultiplier calorie_multiplier (
        .A(distance_this_second),  // Ensure 32 bits
        .B(CALORIE_FACTOR),
        .Product(calories_this_second)  // Ensure 32 bits
    );

    // Heart rate and workout intensity classification
    HeartRateComparator hr_comparator (
        .hr_input(hr_input),
        .hr_classification(heart_rate_classification)
    );

    WorkoutIntensityComparator workout_intensity_comparator (
        .avg_heart_rate(average_heart_rate),
        .workout_intensity(workout_intensity)
    );

    initial begin
        total_steps = 0;
        total_distance = 0;
        distance_per_second = 0;
        time_counter = 0;
        max_heart_rate = 0;
        total_calories = 0;
        average_heart_rate = 0;
        heart_rate_sum = 0;
        heart_rate_count = 0;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            total_steps <= 0;
            total_distance <= 0;
            distance_per_second <= 0;
            time_counter <= 0;
            time_elapsed <= 0;
            max_heart_rate <= 0;
            total_calories <= 0;
            average_heart_rate <= 0;
            heart_rate_sum <= 0;
            heart_rate_count <= 0;
        end else if (valid_input) begin
            // Time tracking
            time_counter <= time_counter + 1;
            time_elapsed <= time_counter;

            // Steps and distance calculations
            total_steps <= total_steps + steps_per_second;
            distance_per_second <= distance_this_second;  // Use 32 bits
            total_distance <= total_distance + distance_this_second;  // Use 32 bits

            // Calories burned
            total_calories <= total_calories + calories_this_second;  // Use 32 bits

            // Heart rate tracking
            if (hr_input > max_heart_rate)
                max_heart_rate <= hr_input;

            heart_rate_sum <= heart_rate_sum + hr_input;
            heart_rate_count <= heart_rate_count + 1;
            average_heart_rate <= heart_rate_sum / heart_rate_count;
        end
    end

endmodule
