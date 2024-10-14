module FullAdderGateLevel (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    wire xor_ab, and_ab, and_cin_xor_ab;

    // XOR gates for sum
    xor (xor_ab, a, b);       // First XOR for a and b
    xor (sum, xor_ab, cin);   // Second XOR with cin to get sum

    // AND and OR gates for carry out
    and (and_ab, a, b);                     // AND gate for a and b
    and (and_cin_xor_ab, cin, xor_ab);      // AND gate for cin and (a ^ b)
    or (cout, and_ab, and_cin_xor_ab);      // OR gate for carry out
endmodule


module LogicalAdderGateLevel (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [31:0] carry;  // Carry outputs from the full adders

    // Instantiate the first Full Adder (Least Significant Bit)
    FullAdderGateLevel fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0),       // Initial carry input is 0
        .sum(sum[0]),
        .cout(carry[0])
    );

    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin: adder_chain
            // Instantiate a Full Adder for each bit
            FullAdderGateLevel fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i-1]), // Previous carry
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate
endmodule

module GateLevelMultiplierDataflow (
    input [31:0] A,               // 32-bit multiplicand
    input [31:0] B,               // 32-bit multiplier
    output [63:0] Product         // 64-bit product (to accommodate overflow)
);
    wire [31:0] partial_product[31:0]; // Array to hold partial products
    wire [63:0] sum[31:0];          // Array to hold intermediate sums

    genvar i, j;

    // Generate partial products (AND operation)
    generate
        for (i = 0; i < 32; i = i + 1) begin: partial_product_generation
            for (j = 0; j < 32; j = j + 1) begin: generate_partial_products
                assign partial_product[i][j] = A[j] & B[i];  // AND operation for each bit
            end
        end
    endgenerate

    // Initialize the first sum with the first partial product
    assign sum[0] = {32'b0, partial_product[0]}; // Zero-extend to match the sum width

    // Dataflow modeling for summing partial products
    generate
        for (i = 1; i < 32; i = i + 1) begin: summation_loop
            assign sum[i] = {32'b0, partial_product[i]} + sum[i-1];  // Zero-extend and sum
        end
    endgenerate

    assign Product = sum[31];  // Final product output
endmodule


// 8-bit Comparator using Gate Level Modeling
module comparator_8bit_dataflow (
    input [7:0] A,          // 8-bit input A
    input [7:0] B,          // 8-bit input B
    output A_greater,       // Output high if A > B
    output A_less,          // Output high if A < B
    output A_equal          // Output high if A == B
);
    wire [7:0] eq;          // Wire array for equality checks
    wire [7:0] greater;     // Intermediate wire for greater checks
    wire [7:0] less;        // Intermediate wire for less checks

    // Equality logic using XNOR gates
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: equality_check
            xnor u_eq(eq[i], A[i], B[i]); // A[i] XNOR B[i] for equality check
        end
    endgenerate

    assign A_equal = &eq; // A is equal to B if all bits are equal

    // Less than logic
    assign A_less = (~A[7] & B[7]) |                  // Case: MSB A < B
                    (eq[7] & ~A[6] & B[6]) |         // Case: 2nd MSB A < B
                    (eq[7] & eq[6] & ~A[5] & B[5]) | // Case: 3rd MSB A < B
                    (eq[7] & eq[6] & eq[5] & ~A[4] & B[4]) |
                    (eq[7] & eq[6] & eq[5] & eq[4] & ~A[3] & B[3]) |
                    (eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & ~A[2] & B[2]) |
                    (eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & eq[2] & ~A[1] & B[1]) |
                    (eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & eq[2] & eq[1] & ~A[0] & B[0]);

    // Greater than logic
    assign A_greater = (A[7] & ~B[7]) |                // Case: MSB A > B
                       (eq[7] & A[6] & ~B[6]) |      // Case: 2nd MSB A > B
                       (eq[7] & eq[6] & A[5] & ~B[5]) |
                       (eq[7] & eq[6] & eq[5] & A[4] & ~B[4]) |
                       (eq[7] & eq[6] & eq[5] & eq[4] & A[3] & ~B[3]) |
                       (eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & A[2] & ~B[2]) |
                       (eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & eq[2] & A[1] & ~B[1]) |
                       (eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & eq[2] & eq[1] & A[0] & ~B[0]);
endmodule


// Heart Rate Comparator using Gate Level Modeling
module HeartRateComparatorDataflow (
    input [7:0] hr_input,          // 8-bit heart rate input
    output [1:0] hr_classification  // 2-bit heart rate classification
);
    wire A_greater_150, A_less_150, A_equal_150;
    wire A_greater_180, A_less_180, A_equal_180;

    // Instantiate 8-bit comparators to compare with 150 and 180
    comparator_8bit_dataflow comp150 (
        .A(hr_input),
        .B(8'd150),
        .A_greater(A_greater_150),
        .A_less(A_less_150),
        .A_equal(A_equal_150)
    );

    comparator_8bit_dataflow comp180 (
        .A(hr_input),
        .B(8'd180),
        .A_greater(A_greater_180),
        .A_less(A_less_180),
        .A_equal(A_equal_180)
    );

    // Determine heart rate classification
    assign hr_classification = 
        A_less_150 ? 2'b00 :  // Safe (less than 150)
        A_less_180 ? 2'b01 :  // Warning (between 150 and 180)
                     2'b10;   // Emergency (greater than or equal to 180)
endmodule


// Workout Intensity Comparator using Gate Level Modeling
module WorkoutIntensityComparatorDataflow (
    input [31:0] avg_heart_rate,      // 32-bit average heart rate input
    output [1:0] workout_intensity     // 2-bit workout intensity classification
);
    wire A_greater_120, A_less_120, A_equal_120;
    wire A_greater_160, A_less_160, A_equal_160;

    // Instantiate 8-bit comparators to compare with 120 and 160
    comparator_8bit_dataflow comp120 (
        .A(avg_heart_rate[7:0]),  // Use the lower 8 bits for comparison
        .B(8'd120),
        .A_greater(A_greater_120),
        .A_less(A_less_120),
        .A_equal(A_equal_120)
    );

    comparator_8bit_dataflow comp160 (
        .A(avg_heart_rate[7:0]),  // Use the lower 8 bits for comparison
        .B(8'd160),
        .A_greater(A_greater_160),
        .A_less(A_less_160),
        .A_equal(A_equal_160)
    );

    // Determine workout intensity
    assign workout_intensity = 
        A_less_120 ? 2'b00 :  // WARMUP
        A_less_160 ? 2'b01 :  // FAT BURN
                     2'b10;   // INTENSE CARDIO
endmodule


// Step Calculator using Gate Level Modeling
module StepCalculatorDataflow (
    input wire clk,                   // Clock input
    input wire rst,                   // Reset input
    input wire [7:0] hr_input,       // Heart rate input
    input wire [1:0] steps_per_second,// Steps taken per second
    input wire [7:0] stride_length,   // Length of each stride
    input wire valid_input,           // Flag for valid input
    output reg [15:0] total_steps,    // Total steps counter
    output reg [31:0] total_distance,  // Total distance covered
    output reg [31:0] distance_per_second, // Distance covered per second
    output reg [7:0] time_elapsed,    // Time elapsed in seconds
    output wire [1:0] heart_rate_classification, // Heart rate classification
    output reg [7:0] max_heart_rate,  // Maximum heart rate recorded
    output reg [31:0] total_calories,  // Total calories burned
    output reg [31:0] average_heart_rate, // Average heart rate
    output wire [1:0] workout_intensity, // Workout intensity classification
    output reg [15:0] speed           // Current speed
);

    reg [31:0] heart_rate_sum;        // Sum of heart rates for average calculation
    reg [7:0] heart_rate_count;       // Count of heart rate samples
    reg [7:0] time_counter;           // Counter for elapsed time in seconds
    wire [31:0] distance_this_second; // Distance covered in the current second
    wire [31:0] calories_this_second; // Calories burned in the current second

    // Dataflow modeling for distance and calories calculation
    assign distance_this_second = steps_per_second * stride_length; // Calculate distance this second
    assign calories_this_second = distance_this_second * 50;  // Assuming 50 calories burned per unit distance

    // Heart rate and workout intensity classification
    HeartRateComparatorDataflow hr_comparator (
        .hr_input(hr_input),
        .hr_classification(heart_rate_classification)
    );

    WorkoutIntensityComparatorDataflow workout_intensity_comparator (
        .avg_heart_rate(average_heart_rate),
        .workout_intensity(workout_intensity)
    );

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
            speed <= 0;
        end else if (valid_input) begin
            total_steps <= total_steps + steps_per_second;  // Update total steps
            total_distance <= total_distance + distance_this_second;  // Update total distance
            total_calories <= total_calories + calories_this_second;  // Update total calories

            // Heart rate tracking
            if (hr_input > max_heart_rate)
                max_heart_rate <= hr_input;  // Update max heart rate if current input is greater

            heart_rate_sum <= heart_rate_sum + hr_input; // Accumulate heart rate
            heart_rate_count <= heart_rate_count + 1;     // Increment heart rate sample count
            average_heart_rate <= heart_rate_sum / heart_rate_count; // Calculate average heart rate

            // Time tracking
            time_counter <= time_counter + 1;             // Increment time counter
            time_elapsed <= time_counter;                  // Update elapsed time

            // Speed calculation (distance / time)
            if (time_elapsed > 0)
                speed <= total_distance / time_elapsed;   // Calculate speed
            else
                speed <= 0;                               // Set speed to 0 if no time has elapsed
        end
    end
endmodule

// Heart Rate and Step Comparator using Comparator Modules
module HeartRateAndStepComparator(
    input [7:0] hr_input,           // Current heart rate
    input [7:0] previous_hr,        // Previous heart rate
    input [1:0] steps_input,        // Current steps per second
    input [1:0] previous_steps,     // Previous steps per second
    output [1:0] hr_comparison,     // 2'b00: same, 2'b01: higher, 2'b10: lower
    output step_feedback            // 1: "Good", 0: "Go Faster"
);
    wire A_greater_hr, A_less_hr, A_equal_hr;
    wire A_greater_steps, A_less_steps, A_equal_steps;

    // Compare heart rates using the 8-bit comparator
    comparator_8bit_dataflow hr_comp (
        .A(hr_input),
        .B(previous_hr),
        .A_greater(A_greater_hr),
        .A_less(A_less_hr),
        .A_equal(A_equal_hr)
    );

    // Compare steps per second using the 8-bit comparator
    comparator_8bit_dataflow steps_comp (
        .A({6'b0, steps_input}),           // Zero extend steps_input to match bit-width
        .B({6'b0, previous_steps}),        // Zero extend previous_steps to match bit-width
        .A_greater(A_greater_steps),
        .A_less(A_less_steps),
        .A_equal(A_equal_steps)
    );

    // Determine heart rate comparison
    assign hr_comparison = A_greater_hr ? 2'b01 : 
                           A_less_hr ? 2'b10 : 
                           2'b00;  // Same

    // Determine step feedback: 1 if steps are good (greater or equal), 0 if faster needed
    assign step_feedback = (A_greater_steps | A_equal_steps);
endmodule




