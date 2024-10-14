// Full Adder Dataflow Implementation
module FullAdderDataflow (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    // Dataflow modeling for sum and carry out
    assign sum = a ^ b ^ cin;           // XOR logic for sum
    assign cout = (a & b) | (cin & (a ^ b));  // Carry out logic
endmodule

// 32-bit Logical Adder using Full Adders (Dataflow)
module LogicalAdderDataflow (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [31:0] carry;

    // Dataflow modeling for 32-bit addition
    assign {carry[30:0], sum[0]} = a[0] + b[0];  // First bit addition
    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin: full_adder_chain
            // Dataflow modeling for each bit
            assign {carry[i], sum[i]} = a[i] + b[i] + carry[i-1];
        end
    endgenerate
endmodule

// 32-bit Multiplier Dataflow Implementation
module GateLevelMultiplierDataflow (
    input [31:0] A,    // 32-bit multiplicand
    input [31:0] B,    // 32-bit multiplier
    output [31:0] Product // 32-bit product
);
    wire [31:0] partial_product[31:0];
    wire [31:0] sum[31:0];

    genvar i, j;

    // Dataflow modeling for partial products
    generate
        for (i = 0; i < 32; i = i + 1) begin: partial_product_generation
            for (j = 0; j < 32; j = j + 1) begin: generate_partial_products
                assign partial_product[i][j] = A[j] & B[i];  // AND operation for each bit
            end
        end
    endgenerate

    // Dataflow modeling for summing partial products
    assign sum[0] = partial_product[0];

    generate
        for (i = 1; i < 32; i = i + 1) begin: summation_loop
            assign sum[i] = partial_product[i] + sum[i-1];  // Sum using dataflow
        end
    endgenerate

    assign Product = sum[31];  // Final product output
endmodule

// 8-bit Comparator using Dataflow
module mag_comp8bit (
    input a0, a1, a2, a3, a4, a5, a6, a7, // 8-bit input a
    input b0, b1, b2, b3, b4, b5, b6, b7, // 8-bit input b
    output p,                             // p = (a < b)
    output r,                             // r = (a > b)
    output q                              // q = (a = b)
);

    // Equality condition (q = a == b)
    assign q = (a7 ~^ b7) & (a6 ~^ b6) & (a5 ~^ b5) & (a4 ~^ b4) &
               (a3 ~^ b3) & (a2 ~^ b2) & (a1 ~^ b1) & (a0 ~^ b0);

    // Less than condition (p = a < b)
    assign p = (a7 < b7) || 
               ((a7 ~^ b7) && (a6 < b6)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 < b5)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 < b4)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 ~^ b4) && (a3 < b3)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 ~^ b4) && (a3 ~^ b3) && (a2 < b2)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 ~^ b4) && (a3 ~^ b3) && (a2 ~^ b2) && (a1 < b1)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 ~^ b4) && (a3 ~^ b3) && (a2 ~^ b2) && (a1 ~^ b1) && (a0 < b0));

    // Greater than condition (r = a > b)
    assign r = (a7 > b7) || 
               ((a7 ~^ b7) && (a6 > b6)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 > b5)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 > b4)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 ~^ b4) && (a3 > b3)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 ~^ b4) && (a3 ~^ b3) && (a2 > b2)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 ~^ b4) && (a3 ~^ b3) && (a2 ~^ b2) && (a1 > b1)) ||
               ((a7 ~^ b7) && (a6 ~^ b6) && (a5 ~^ b5) && (a4 ~^ b4) && (a3 ~^ b3) && (a2 ~^ b2) && (a1 ~^ b1) && (a0 > b0));

endmodule

module D_FlipFlop (
    input D,       // Data input
    input clk,     // Clock input
    input rst,     // Reset input
    output reg Q   // Output Q
);
    // Internal signals
    wire D_nand_clk, not_D_nand_clk;
    wire S, R;

    // NAND gates for D input and clock
    nand (D_nand_clk, D, clk);       // D AND clk (through NAND)
    nand (not_D_nand_clk, ~D, clk);  // ~D AND clk (through NAND)

    // Set and Reset (S-R) latch
    nand (S, D_nand_clk, R);         // Set input to the latch
    nand (R, not_D_nand_clk, S);     // Reset input to the latch

    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 0;                  // Reset flip-flop
        else
            Q <= S;                  // Set output based on S-R latch
    end
endmodule
module Register16 (
    input [15:0] D,   // 16-bit data input
    input clk,        // Clock input
    input rst,        // Reset input
    output [15:0] Q   // 16-bit output
);
    // Instantiate 16 D flip-flops for each bit
    D_FlipFlop dff0 (D[0], clk, rst, Q[0]);
    D_FlipFlop dff1 (D[1], clk, rst, Q[1]);
    D_FlipFlop dff2 (D[2], clk, rst, Q[2]);
    D_FlipFlop dff3 (D[3], clk, rst, Q[3]);
    D_FlipFlop dff4 (D[4], clk, rst, Q[4]);
    D_FlipFlop dff5 (D[5], clk, rst, Q[5]);
    D_FlipFlop dff6 (D[6], clk, rst, Q[6]);
    D_FlipFlop dff7 (D[7], clk, rst, Q[7]);
    D_FlipFlop dff8 (D[8], clk, rst, Q[8]);
    D_FlipFlop dff9 (D[9], clk, rst, Q[9]);
    D_FlipFlop dff10 (D[10], clk, rst, Q[10]);
    D_FlipFlop dff11 (D[11], clk, rst, Q[11]);
    D_FlipFlop dff12 (D[12], clk, rst, Q[12]);
    D_FlipFlop dff13 (D[13], clk, rst, Q[13]);
    D_FlipFlop dff14 (D[14], clk, rst, Q[14]);
    D_FlipFlop dff15 (D[15], clk, rst, Q[15]);
endmodule

// Heart Rate Comparator Dataflow Implementation
module HeartRateComparatorDataflow (
    input [7:0] hr_input,
    output [1:0] hr_classification
);
    // Dataflow modeling for heart rate classification
    assign hr_classification = (hr_input <= 150) ? 2'b00 : 
                               (hr_input <= 180) ? 2'b01 : 2'b10;  // Safe, Warning, Emergency
endmodule

// Workout Intensity Comparator Dataflow
module WorkoutIntensityComparatorDataflow (
    input [31:0] avg_heart_rate,
    output [1:0] workout_intensity
);
    // Dataflow modeling for workout intensity
    assign workout_intensity = (avg_heart_rate < 120) ? 2'b00 :   // WARMUP
                               (avg_heart_rate <= 160) ? 2'b01 :  // FAT BURN
                               2'b10;  // INTENSE CARDIO
endmodule

// Step Calculator Dataflow
module StepCalculatorDataflow (
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
    output wire [1:0] workout_intensity,
    output reg [15:0] speed
);

    reg [31:0] heart_rate_sum;
    reg [7:0] heart_rate_count;
    reg [7:0] time_counter;
    wire [31:0] distance_this_second;
    wire [31:0] calories_this_second;

    // Dataflow modeling for distance and calories
    assign distance_this_second = steps_per_second * stride_length;
    assign calories_this_second = (15 * time_elapsed * average_heart_rate) / 1000;  // Based on time and avg HR

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
            total_steps <= total_steps + steps_per_second;  // Dataflow addition for steps
            total_distance <= total_distance + distance_this_second;  // Update distance
            total_calories <= calories_this_second;  // Update calories

            // Heart rate tracking
            if (hr_input > max_heart_rate)
                max_heart_rate <= hr_input;

            heart_rate_sum <= heart_rate_sum + hr_input;
            heart_rate_count <= heart_rate_count + 1;
            average_heart_rate <= heart_rate_sum / heart_rate_count;

            // Time tracking
            time_counter <= time_counter + 1;
            time_elapsed <= time_counter;

            // Speed calculation (distance / time)
            if (time_elapsed > 0)
                speed <= total_distance / time_elapsed;
            else
                speed <= 0;
        end
    end
endmodule

// Heart Rate and Step Comparator Module
module HeartRateAndStepComparator(
    input [7:0] hr_input,           // Current heart rate
    input [7:0] previous_hr,        // Previous heart rate
    input [1:0] steps_input,        // Current steps per second
    input [1:0] previous_steps,     // Previous steps per second
    output reg [1:0] hr_comparison, // 2'b00: same, 2'b01: higher, 2'b10: lower
    output reg step_feedback        // 1: "Good", 0: "Go Faster"
);

    always @(*) begin
        // Compare heart rates
        if (hr_input > previous_hr)
            hr_comparison = 2'b01;  // Higher
        else if (hr_input < previous_hr)
            hr_comparison = 2'b10;  // Lower
        else
            hr_comparison = 2'b00;  // Same

        // Compare steps per second
        if (steps_input >= previous_steps)
            step_feedback = 1;      // Good
        else
            step_feedback = 0;      // Go Faster
    end
endmodule
