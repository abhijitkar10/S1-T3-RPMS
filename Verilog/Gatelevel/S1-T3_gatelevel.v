// FlipFlop Module for D Flip-Flop using basic gates
module FlipFlop (
    input D,         // Data input
    input clk,       // Clock input
    input rst,       // Reset input
    output Q         // Output Q
);
    wire rst_n;  // Inverted reset
    wire D_and_clk;
    wire Q_and_clk_n;
    wire Q_next;

    // Invert reset
    not (rst_n, rst);

    // Q_next = (D AND clk) OR (Q AND NOT clk) when not reset
    and (D_and_clk, D, clk);
    not (clk_n, clk);
    and (Q_and_clk_n, Q, clk_n);
    or (Q_next, D_and_clk, Q_and_clk_n);

    // If reset is active, output is 0
    and (Q_rst, rst_n, Q_next);

    // Output assignment
    assign Q = Q_rst;
endmodule

// Clock Divider for generating 1 Hz from 50 MHz clock
module ClockDivider(
    input clk,       // Input clock
    input rst,       // Reset input
    output reg clk_out  // Output clock (1 Hz)
);
    reg [25:0] counter;  // 26-bit counter to divide clock

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 26'b0;
            clk_out <= 0;
        end else if (counter == 26'd50_000_000 - 1) begin
            counter <= 26'b0;
            clk_out <= ~clk_out;  // Toggle clock output every 50 million cycles (1 second for 50 MHz)
        end else begin
            counter <= counter + 1;
        end
    end
endmodule


// Stopwatch Module using FlipFlops
module Stopwatch(
    input clk,        // System clock (50 MHz assumed)
    input rst,        // Reset input
    output [5:0] sec, // Seconds counter (0-59)
    output [5:0] min  // Minutes counter (0-59)
);
    wire clk_1hz;  // 1 Hz clock for seconds
    wire [5:0] sec_next, min_next; // Wires for next second and minute values

    // Clock divider to generate 1 Hz clock
    ClockDivider clk_divider (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_1hz)
    );

    // Flip-flops for seconds
    FlipFlop ff_sec0 (.D(sec_next[0]), .clk(clk_1hz), .rst(rst), .Q(sec[0]));
    FlipFlop ff_sec1 (.D(sec_next[1]), .clk(clk_1hz), .rst(rst), .Q(sec[1]));
    FlipFlop ff_sec2 (.D(sec_next[2]), .clk(clk_1hz), .rst(rst), .Q(sec[2]));
    FlipFlop ff_sec3 (.D(sec_next[3]), .clk(clk_1hz), .rst(rst), .Q(sec[3]));
    FlipFlop ff_sec4 (.D(sec_next[4]), .clk(clk_1hz), .rst(rst), .Q(sec[4]));
    FlipFlop ff_sec5 (.D(sec_next[5]), .clk(clk_1hz), .rst(rst), .Q(sec[5]));

    // Flip-flops for minutes
    FlipFlop ff_min0 (.D(min_next[0]), .clk(clk_1hz), .rst(rst), .Q(min[0]));
    FlipFlop ff_min1 (.D(min_next[1]), .clk(clk_1hz), .rst(rst), .Q(min[1]));
    FlipFlop ff_min2 (.D(min_next[2]), .clk(clk_1hz), .rst(rst), .Q(min[2]));
    FlipFlop ff_min3 (.D(min_next[3]), .clk(clk_1hz), .rst(rst), .Q(min[3]));
    FlipFlop ff_min4 (.D(min_next[4]), .clk(clk_1hz), .rst(rst), .Q(min[4]));
    FlipFlop ff_min5 (.D(min_next[5]), .clk(clk_1hz), .rst(rst), .Q(min[5]));

    // Logic for next second and minute values
    assign sec_next = (sec == 59) ? 0 : sec + 1;  // Reset seconds to 0 when reaching 59
    assign min_next = (sec == 59) ? ((min == 59) ? 0 : min + 1) : min;  // Increment minutes when seconds reset
endmodule

// Full Adder Gatelevel Implementation
module FullAdderGate (
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

// 32-bit Logical Adder using Full Adders (Gate-Level)
module LogicalAdderGate (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [31:0] carry;  // Carry outputs from the full adders

    // Instantiate the first Full Adder (Least Significant Bit)
    FullAdderGate fa0 (
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
            FullAdderGate fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i-1]), // Previous carry
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate
endmodule

// 32-bit Multiplier GateLevel Implementation
module GateLevelMultiplierDataflow (
    input [31:0] A,    // 32-bit multiplicand
    input [31:0] B,    // 32-bit multiplier
    output [31:0] Product // 32-bit product
);
    wire [31:0] partial_product[31:0];
    wire [31:0] sum[31:0];       // Wires to hold intermediate sums
    wire [31:0] carry[31:0];     // Wires to hold intermediate carries

    genvar i, j;

    // Generate partial products using AND gates
    generate
        for (i = 0; i < 32; i = i + 1) begin: partial_product_generation
            for (j = 0; j < 32; j = j + 1) begin: generate_partial_products
                and (partial_product[i][j], A[j], B[i]);  // AND operation for each bit
            end
        end
    endgenerate

    // Initialize the first row as the first partial product without carry addition
    assign sum[0] = partial_product[0];
    assign carry[0] = 0;  // No carry in the first row

    // Summing partial products using full adders
    generate
        for (i = 1; i < 32; i = i + 1) begin: summation_loop
            for (j = 0; j < 32; j = j + 1) begin: full_adder_summation
                if (j == 0) begin
                    // Handle the least significant bit (LSB) without carry-in
                    FullAdderGate fa (
                        .a(partial_product[i][j]),
                        .b(sum[i-1][j]),
                        .cin(1'b0),
                        .sum(sum[i][j]),
                        .cout(carry[i][j])
                    );
                end else begin
                    // Handle the other bits with carry-in
                    FullAdderGate fa (
                        .a(partial_product[i][j]),
                        .b(sum[i-1][j]),
                        .cin(carry[i][j-1]),  // Carry from previous bit
                        .sum(sum[i][j]),
                        .cout(carry[i][j])
                    );
                end
            end
        end
    endgenerate

    // The final product is the sum of all partial products
    assign Product = sum[31];

endmodule

// 8-bit Comparator using Dataflow
module mag_comp8bit (
    input a0, a1, a2, a3, a4, a5, a6, a7,  // 8-bit input a
    input b0, b1, b2, b3, b4, b5, b6, b7,  // 8-bit input b
    output p,                              // p = (a < b)
    output r,                              // r = (a > b)
    output q                               // q = (a = b)
);
    wire eq7, eq6, eq5, eq4, eq3, eq2, eq1, eq0;

    // Gate-level equality condition (q = a == b)
    xnor(eq7, a7, b7);  // XNOR gate for a7 and b7
    xnor(eq6, a6, b6);  // XNOR gate for a6 and b6
    xnor(eq5, a5, b5);  // XNOR gate for a5 and b5
    xnor(eq4, a4, b4);  // XNOR gate for a4 and b4
    xnor(eq3, a3, b3);  // XNOR gate for a3 and b3
    xnor(eq2, a2, b2);  // XNOR gate for a2 and b2
    xnor(eq1, a1, b1);  // XNOR gate for a1 and b1
    xnor(eq0, a0, b0);  // XNOR gate for a0 and b0

endmodule
    and (q, eq7, eq6, eq5, eq4, eq3, eq2, eq1, eq0);  // AND all equality checks for q

    // Gate-level less than condition (p = a < b)
    wire lt7, lt6, lt5, lt4, lt3, lt2, lt1, lt0;
    wire n_eq7, n_eq6, n_eq5, n_eq4, n_eq3, n_eq2, n_eq1;

    not (n_eq7, eq7);  // Inverted equality for a7 and b7
    not (n_eq6, eq6);  // Inverted equality for a6 and b6
    not (n_eq5, eq5);  // Inverted equality for a5 and b5
    not (n_eq4, eq4);  // Inverted equality for a4 and b4
    not (n_eq3, eq3);  // Inverted equality for a3 and b3
    not (n_eq2, eq2);  // Inverted equality for a2 and b2
    not (n_eq1, eq1);  // Inverted equality for a1 and b1

    and (lt7, n_eq7, ~a7, b7);  // (a7 < b7)
    and (lt6, eq7, n_eq6, ~a6, b6);  // a7 = b7, (a6 < b6)
    and (lt5, eq7, eq6, n_eq5, ~a5, b5);  // a7 = b7, a6 = b6, (a5 < b5)
    and (lt4, eq7, eq6, eq5, n_eq4, ~a4, b4);  // a7 = b7, a6 = b6, a5 = b5, (a4 < b4)
    and (lt3, eq7, eq6, eq5, eq4, n_eq3, ~a3, b3);  // a7 = b7, a6 = b6, a5 = b5, a4 = b4, (a3 < b3)
    and (lt2, eq7, eq6, eq5, eq4, eq3, n_eq2, ~a2, b2);  // a7 = b7, a6 = b6, a5 = b5, a4 = b4, a3 = b3, (a2 < b2)
    and (lt1, eq7, eq6, eq5, eq4, eq3, eq2, n_eq1, ~a1, b1);  // a7 = b7, a6 = b6, a5 = b5, a4 = b4, a3 = b3, a2 = b2, (a1 < b1)
    and (lt0, eq7, eq6, eq5, eq4, eq3, eq2, eq1, ~a0, b0);  // a7 = b7, a6 = b6, a5 = b5, a4 = b4, a3 = b3, a2 = b2, a1 = b1, (a0 < b0)

    or (p, lt7, lt6, lt5, lt4, lt3, lt2, lt1, lt0);  // OR all less than conditions for p

    // Gate-level greater than condition (r = a > b)
    wire gt7, gt6, gt5, gt4, gt3, gt2, gt1, gt0;

    and (gt7, n_eq7, a7, ~b7);  // (a7 > b7)
    and (gt6, eq7, n_eq6, a6, ~b6);  // a7 = b7, (a6 > b6)
    and (gt5, eq7, eq6, n_eq5, a5, ~b5);  // a7 = b7, a6 = b6, (a5 > b5)
    and (gt4, eq7, eq6, eq5, n_eq4, a4, ~b4);  // a7 = b7, a6 = b6, a5 = b5, (a4 > b4)
    and (gt3, eq7, eq6, eq5, eq4, n_eq3, a3, ~b3);  // a7 = b7, a6 = b6, a5 = b5, a4 = b4, (a3 > b3)
    and (gt2, eq7, eq6, eq5, eq4, eq3, n_eq2, a2, ~b2);  // a7 = b7, a6 = b6, a5 = b5, a4 = b4, a3 = b3, (a2 > b2)
    and (gt1, eq7, eq6, eq5, eq4, eq3, eq2, n_eq1, a1, ~b1);  // a7 = b7, a6 = b6, a5 = b5, a4 = b4, a3 = b3, a2 = b2, (a1 > b1)
    and (gt0, eq7, eq6, eq5, eq4, eq3, eq2, eq1, a0, ~b0);  // a7 = b7, a6 = b6, a5 = b5, a4 = b4, a3 = b3, a2 = b2, a1 = b1, (a0 > b0)

    or (r, gt7, gt6, gt5, gt4, gt3, gt2, gt1, gt0);  // OR all greater than conditions for r

endmodule

// Heart Rate Comparator  Implementation
module HeartRateComparatorDataflow (
    input [7:0] hr_input,
    output [1:0] hr_classification
);
    //  modeling for heart rate classification
    assign hr_classification = (hr_input <= 150) ? 2'b00 :
                               (hr_input <= 180) ? 2'b01 : 2'b10;  // Safe, Warning, Emergency
endmodule

// Workout Intensity Comparator
module WorkoutIntensityComparatorDataflow (
    input [31:0] avg_heart_rate,
    output [1:0] workout_intensity
);
    //  modeling for workout intensity
    assign workout_intensity = (avg_heart_rate < 120) ? 2'b00 :   // WARMUP
                               (avg_heart_rate <= 160) ? 2'b01 :  // FAT BURN
                               2'b10;  // INTENSE CARDIO
endmodule

// Step Calculator 
module StepCalculatorDataflow (
    input wire clk,
    input wire rst,
    input wire [7:0] hr_input,
    input wire [2:0] steps_per_second,
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

    //  modeling for distance and calories
    assign distance_this_second = steps_per_second * stride_length;
    assign calories_this_second = (15 * time_elapsed * average_heart_rate) / 8000;  // Based on time and avg HR

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
            total_steps <= total_steps + steps_per_second;  //  addition for steps
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
    input [2:0] steps_input,        // Current steps per second
    input [2:0] previous_steps,     // Previous steps per second
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

module TimeElapsedCounter(
    input clk_1hz,   // 1 Hz clock input
    input rst,       // Reset input
    output [5:0] time_elapsed  // 6-bit output for seconds (0-59)
);
    wire [5:0] next_value;  // Wire for the next value of the counter
    wire [5:0] carry;       // Carry bits for each flip-flop stage
    wire reset_condition;   // Reset when counter reaches 59 (111011)

    // Flip-flops for each bit of the time_elapsed counter
    FlipFlop ff0 (.D(next_value[0]), .clk(clk_1hz), .rst(rst), .Q(time_elapsed[0]));
    FlipFlop ff1 (.D(next_value[1]), .clk(clk_1hz), .rst(rst), .Q(time_elapsed[1]));
    FlipFlop ff2 (.D(next_value[2]), .clk(clk_1hz), .rst(rst), .Q(time_elapsed[2]));
    FlipFlop ff3 (.D(next_value[3]), .clk(clk_1hz), .rst(rst), .Q(time_elapsed[3]));
    FlipFlop ff4 (.D(next_value[4]), .clk(clk_1hz), .rst(rst), .Q(time_elapsed[4]));
    FlipFlop ff5 (.D(next_value[5]), .clk(clk_1hz), .rst(rst), .Q(time_elapsed[5]));

    // Gate-level logic to increment the counter using 'and' gates only
    and (carry[0], time_elapsed[0], 1'b1);  // Carry for the LSB
    not (next_value[0], time_elapsed[0]);   // Toggle LSB

    and (carry[1], time_elapsed[1], time_elapsed[0]);
    xor (next_value[1], time_elapsed[1], carry[0]);  // Second bit toggles based on carry from LSB

    and (carry[2], time_elapsed[2], carry[1]);
    xor (next_value[2], time_elapsed[2], carry[1]);

    and (carry[3], time_elapsed[3], carry[2]);
    xor (next_value[3], time_elapsed[3], carry[2]);

    and (carry[4], time_elapsed[4], carry[3]);
    xor (next_value[4], time_elapsed[4], carry[3]);

    and (carry[5], time_elapsed[5], carry[4]);
    xor (next_value[5], time_elapsed[5], carry[4]);

    // Reset the counter when it reaches 59 (binary 111011)
    and (reset_condition, time_elapsed[5], time_elapsed[4], time_elapsed[3], ~time_elapsed[2], time_elapsed[1], time_elapsed[0]);

    // Reset logic
    assign next_value = (reset_condition) ? 6'b000000 : next_value;

endmodule
