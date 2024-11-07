
<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S1

  > Team ID: S1-T3

  > Member-1: Abhijit Kar, 231CS106, abhijitkar.231cs106@nitk.edu.in

  > Member-2: Sarth Santosh Shah, 231CS154, sarthshah.231cs154@nitk.edu.in

  > Member-3: Aaryan Yadav, 231CS104, aaryanyadav.231cs104@nitk.edu.in
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
  
1. **Motivation:** For a runner, every step marks progress, and every heartbeat reflects determination. Running is more than just physical activity—it’s a journey of self-improvement and resilience. To support this growth, a tool is needed to accurately track performance and inspire continuous improvement. Our goal is to create a system that focuses on essential metrics like steps, distance, and heart rate, without the complexity of overcomplicated devices. One of our teammates, an avid runner who has participated in several college events, identified the need for such a device, believing it would help enhance performance. His experience was a key factor in motivating us to pursue this project. Real-time data offers powerful motivation, pushing runners to reach new personal bests. This project is about more than building a performance tracker; it’s about capturing the spirit of running—helping runners celebrate progress, understand their limits, and push beyond them.

2. **Problem Statement:** Optimizing physical performance is essential for runners, athletes, and fitness enthusiasts in today’s active lifestyle. Effective monitoring of performance metrics is crucial for enhancing training efficiency and ensuring user safety during exercise. While many advanced gadgets are available, the challenge lies in creating a simple, cost-effective, and reliable system using fundamental digital logic components. This project proposes the **Runner’s Performance Monitoring System**, utilizing logic gates to measure essential metrics, including steps taken, distance traveled, maximum heart rate, average heart rate, and safety alerts. The system will provide real-time motivational feedback and safety classifications, empowering runners to enhance their training while remaining safe. The core idea is to design a digital system that operates without the complexity of microcontrollers or software solutions. It will leverage combinational circuits, counters, registers, flip-flops, and comparators to process and display necessary data, enabling efficient operation focused on critical parameters for tracking, optimizing, and ensuring the safety of a runner’s performance.

3. **Features:** This system is designed to assist athletes in monitoring their performance during running sessions, using both sequential and combinational circuits. It consists of five key components:
    1. **Heartbeat Monitoring System:** Plays a crucial role in ensuring the athlete’s safety during workouts. It continuously monitors heart rate inputs taken at regular intervals and calculates the average heartbeat instantaneously.
    - The system has two types of classifications:
      - Based on the instantaneous heart rate:
        - a. **Green State (Safe Heartbeat):** Indicates that the athlete’s heart rate is within a safe range, allowing them to continue their activity without concern.
        - b. **Yellow State (Warning):** Signals that the heart rate is approaching a threshold that may require caution, prompting the athlete to be aware of their exertion level.
        - c. **Red State (Emergency Heartbeat):** Represents a critical condition where the heart rate exceeds safe limits. If this state is reached, an alarm is triggered to alert the athlete to take immediate action.
      - Based on the average heart rate: At the end of the run, the system evaluates the athlete’s average heart rate and classifies their performance into one of three distinct stages:
        - a. **Warmup Zone:** The athlete’s average heart rate remains low, indicating a light exercise intensity, suitable for warming up the body before engaging in more strenuous activity.
        - b. **Fat Burning Zone:** The heart rate is elevated to an optimal range for burning fat, where the body efficiently uses fat as the primary energy source. This zone is ideal for sustained, moderate-intensity exercise.
        - c. **Maximum Effort Zone:** The heart rate reaches a high level, pushing the athlete into a more intense workout. This is ideal for short bursts of high-intensity effort.
    - Additionally, the system records the peak heartbeat of the athlete during the session, providing valuable data for evaluating cardiovascular fitness. Knowing the peak heart rate helps athletes adjust their training intensity and avoid overexertion.
    2. **Pedometer:** Tracks the steps covered by the athlete and calculates the distance traveled during their run. It requires the user to input their stride length, which allows for accurate distance measurements.
    - **Key Features include:**
      - **Real-Time Step Counting:** Continuously counts the number of steps taken, providing immediate feedback on the athlete’s activity level.
      - **Distance Calculation:** Displays the total distance covered based on the stride length, enabling athletes to set and achieve distance goals.
      - **Speed Calculation:** Calculates and displays the athlete’s speed in real-time, helping them gauge their pace and make adjustments as needed.
      - **Time Tracking:** Records the duration of the workout, allowing users to analyze their pace and improve their running strategy.
      - **Calories Burnt Calculation and Display:** The system provides an estimate of how many calories the athlete has burned during the session.
      - Trainer Module: Before starting a run, the user selects the type of run (e.g., light jog, sprint), and the system informs them in real-time whether they are meeting the expected performance.

    3. **Time Monitoring System:** It includes a stopwatch that activates when the athlete starts their activity. This stopwatch is vital, as multiple components in the system depend on it. It continuously tracks the duration of the workout and is essential for calculating key performance metrics, including speed, distance covered, and calories burned. Its integration ensures real-time accuracy and consistency, supporting other features like heartbeat monitoring and the pedometer. This allows athletes to receive precise feedback on their performance and make informed adjustments during their sessions.

    4.  **Progress Evaluator:** Compares the athlete’s current session performance with data from previous sessions. This feature
  shows whether the athlete’s performance has improved or declined, helping them adjust their training for better results over
    time.
  

    5. **End of Session Summary:** At the conclusion of each workout session, the system provides a comprehensive end-of-session summary. This summary includes:
    - Average heartbeat
    - Peak heartbeat
    - Total distance covered
    - Total calories burnt
    - Total workout duration
    - Improvement compared to previous run 
    This summary helps athletes analyze their performance, set future goals, and track their progress over time.
</details>

<!-- Third Section -->
## Functional Block Diagram
<details>
  <summary>Detail</summary>

![Untitled Diagram drawio (4) (1)](https://github.com/user-attachments/assets/785d833a-a684-407d-bc69-eff523959269)

</details>


<!-- Fourth Section -->
## Working
<details>
  <summary>Detail</summary>
      Main Module: In this system, the user’s heart rate and steps per second are provided as inputs. Additionally, the user
      selects the type of run, which can be either a walk, light jog, fast jog, or sprint. The circuit is activated by a start button
      that links and synchronizes all the other modules. When the user initiates the run, the input data is stored and distributed to
      the various modules, each responsible for specific functionalities and calculations. These modules process the data to generate
      different classifications based on the user’s performance. Upon completion of the run, the final results are displayed, providing a
      comprehensive overview of the runner’s performance.

  ## 1. Stopwatch (Time Monitoring System)  
This module governs the operation of the entire circuit. It is enabled when the runner starts running and is deactivated once the run is completed. The module consists of the following submodules:  

- **Timer Module**: Utilizes mod-10 and mod-6 counters to generate the time elapsed in hours, minutes, and seconds.  
- **Timer Display Module**: Comprises 7-segment display decoders and converters for displaying the elapsed time.  

## 2. Heart Rate Monitoring System  
This system tracks and evaluates the runner's heart rate and includes the following components:  

- **Heart Rate Generator Module**: Acts as a replacement for a heart rate sensor, generating unique heart rate values every second using specific logic, which are then input into the system.  
- **Average Heart Rate and Calories Burnt Module**: Employs combinational circuits to calculate two key features: average heart rate and calories burned. For calories burned, we developed a formula that closely replicates real-world values using the average heart rate for calculations:  
  - **Calories Burnt = Average Heart Rate × Time Elapsed × Constant** (where constant = 0.0015).  
- **Performance Evaluator**: This module evaluates the runner's performance by comparing the current heart rate values to those from a previous run. After each run, the instantaneous heart rate values are stored in a set of registers governed by specific logic. During the next run, current values are compared to the previously stored values, and the registers are updated regularly after each run is completed.  
- **Peak Heart Rate**: The maximum heart rate of the runner is updated instantaneously.  

The system makes two types of classifications:  
1. Based on instantaneous heart rate.  
2. Based on average heart rate.  

## 3. Pedometer  
This module focuses on calculating various parameters based on the runner's steps per second and allows the runner to select the type of run they desire:  

- **Step Generator**: Serves as a replacement for a step sensor, generating unique values of steps per second using specific logic every second, which are passed as input to the system.  
- **Speed and Distance Module**: Comprises combinational circuits for performing arithmetic calculations related to speed and distance.  
- **Trainer Module**: Compares the runner's current speed to their desired speed (indicated by the input type of run) and provides real-time feedback to help the runner adjust their pace as needed.  

## 4. Display Modules  
This module consists of components that convert binary numbers to BCD (Binary-Coded Decimal) numbers. The BCD values are then utilized by a 7-segment display decoder, which finally displays the output in decimal format. This feature simplifies comprehension for the user, as reading binary values can be tedious.
      

     


  
### State Diagram:

![final drawio (1)](https://github.com/user-attachments/assets/55497d9f-feb3-4b16-aa4c-1251be80ded6)


### Module Functional Table:

| Module                | Input Signals                        | Output Signals               | Operation / Description                                                                                                                                 |
|-----------------------|--------------------------------------|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| FullAdder Dataflow     | a, b, cin (1-bit each)               | sum, cout (1-bit each)        | Performs the sum of three 1-bit inputs: sum = a ^ b ^ cin, cout = (a & b) | (cin & (a ^ b))                                                              |
| LogicalAdder Dataflow  | a, b (32-bit)                        | sum (32-bit)                  | Performs 32-bit addition using full adders.                                                                                                             |
| GateLevel Multiplier   | A, B (32-bit)                        | Product (32-bit)              | Computes the product of two 32-bit inputs using gate-level logic.                                                                                       |
| mag_comp 8bit          | a[7:0], b[7:0] (8-bit)               | p, r, q (1-bit each)          | Compares two 8-bit inputs: p = a < b, r = a > b, q = a == b.                                                                                             |
| D Flip Flop            | D, clk, rst (1-bit each)             | Q (1-bit)                     | A D flip-flop that stores data on the rising edge of the clock or resets asynchronously.                                                                 |
| Register 16            | D[15:0], clk, rst (16-bit data, clk) | Q[15:0]                       | Stores 16-bit input data and provides it as output on the next clock cycle, with reset functionality.                                                   |
| HeartRate Comparator   | hr_input (8-bit)                     | hr_classification (2-bit)     | Classifies heart rate into safe, warning, or emergency zones.                                                                                           |
| Workout Intensity Comp | avg_heart_rate (32-bit)              | workout_intensity (2-bit)     | Classifies workout intensity based on average heart rate into warmup, fat burn, or intense cardio.                                                      |

### StepCalculatorDataflow Truth Table:

| Cycle | hr_input | steps_per_second | stride_length | valid_input | total_steps |
|-------|----------|------------------|---------------|-------------|-------------|
| 1     | 130      | 1                | 80            | 1           | 1           |
| 2     | 140      | 2                | 80            | 1           | 3           |
| 3     | 160      | 3                | 80            | 1           | 6           |
| 4     | 180      | 4                | 80            | 1           | 10          |
| 5     | 200      | 3                | 80            | 1           | 13          |

| Total Distance (cm) | Time Elapsed (s) | Heart Rate Classification | Max Heart Rate |
|---------------------|------------------|---------------------------|----------------|
| 240                 | 1                | Safe (00)                  | 130            |
| 400                 | 2                | Safe (00)                  | 140            |
| 720                 | 3                | Warning (01)               | 160            |
| 960                 | 4                | Warning (01)               | 180            |
| 1200                | 5                | Emergency (10)             | 200            |

| Total Calories (kcal) | Average Heart Rate | Speed (cm/s) |
|-----------------------|--------------------|--------------|
| 1.95                  | 130                | 240          |
| 5.1                   | 135                | 200          |
| 11.4                  | 143.3              | 240          |
| 21.0                  | 152.5              | 240          |
| 33.0                  | 162                | 240          |

</details>

<!-- Fifth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>
This is the main module of the circuit.
	<details>
  <summary>MAIN</summary>
		This is the Main Module which integrates all the submodules to form our runner's performance monitoring system .

![MAIN MODULE](https://github.com/user-attachments/assets/433005a2-aa8d-44f4-93d6-425e3d984978)

 </details>
The submodules of HEART RATE MONITORING COMPONENT  are
<details>
  <summary>HR GENERATOR </summary>

![HR_GENERATOR](https://github.com/user-attachments/assets/dee01c50-5517-4310-a1c7-159137277b88)

</details>
<details>
  <summary>PERFORMANCE EVALUATOR </summary>
	

![PERFORMANCE_EVALUATOR-](https://github.com/user-attachments/assets/869fce95-c6b6-43c1-90e2-3c38eef5ae86)

</details>
<details>
  <summary>AVG HR AND CALORIE</summary>


![AVG HR AND CALORIE](https://github.com/user-attachments/assets/018eb8fe-c0f7-434b-954b-b32a0c56e394)

</details>
<details>
  <summary>PEAK HR</summary>

![PEAK HR](https://github.com/user-attachments/assets/45247788-4650-4730-8630-9a565f51d9dc)

</details>
The Submodules of Pedometer are :
<details>
  <summary>STEP GENERATOR</summary>


![STEP_GENERATOR](https://github.com/user-attachments/assets/13cb5c3b-2397-46df-a8cb-dcb7e6e73114)

</details>
<details>
  <summary>TRAINER</summary>
	
![TRAINER](https://github.com/user-attachments/assets/79a3dcdd-9b74-4788-a1da-75daaf720a87)

</details>
<details>
  <summary>SPEED N DISTANCE</summary>
	
![SPEED N DISTANCE](https://github.com/user-attachments/assets/2bf96dd7-5b52-4df8-bc01-c409ae4fa1bb)


</details>
The Submodules for STOP WATCH and DISPLAYING
<details>
  <summary>TIMER</summary>
	
![TIMER](https://github.com/user-attachments/assets/57d6230a-6f5f-4b73-8645-f0f1e337d27b)


</details>
<details>
  <summary>TIMER DISPLAY</summary>
	

![TIMER FOR STOPWATCH](https://github.com/user-attachments/assets/44231d29-820d-40fa-990b-715ed8d7a526)

</details>
<details>
  <summary>7-bit Binary to BCD </summary>


![7-BIT BINARY TO BCD](https://github.com/user-attachments/assets/bbc6e9e2-c1e7-458e-926d-e2300eb417c7)

</details>
<details>
  <summary>BCD TO 7-SEGMENT</summary>


![BCD TO 7-SEGMENT converter](https://github.com/user-attachments/assets/540d0032-8f07-45f0-b3b3-b480e66adb73)

</details>
<details>
  <summary>CLASSIFIER</summary>
	
![WORKOUT INTENSITY](https://github.com/user-attachments/assets/9e75dec2-ceea-4fbf-b4c8-45844ba78608)


</details>


</details>


<!-- Fifth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>
  THIS IS THE VERILOG CODE IN BOTH GATE LEVEL AND DATA FLOW LEVEL
  <details>
  <summary>GATELEVEL CODE </summary>

  ```verilog
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
```

</details>
<details>

	

	
 

  <summary>GATELEVEL TESTBENCH CODE </summary>
  
  
```verilog
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
```

</details>
<details>

	

	
 

  <summary>DATAFLOW LEVEL CODE </summary>
	
 ```verilog
module D_FlipFlop (
    input D,         // Data input
    input clk,       // Clock input
    input rst,       // Reset input
    output Q         // Output Q
);
    wire not_clk, not_rst, D_clk;

    // Invert the clock and reset
    assign not_clk = ~clk;
    assign not_rst = ~rst;

    // Logic to determine the output Q
    assign D_clk = (D & clk) | (not_clk & Q);

    // Reset logic
    assign Q = (not_rst) ? D_clk : 1'b0; // Output is D_clk unless rst is high
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
    D_FlipFlop  ff_sec0 (.D(sec_next[0]), .clk(clk_1hz), .rst(rst), .Q(sec[0]));
    D_FlipFlop  ff_sec1 (.D(sec_next[1]), .clk(clk_1hz), .rst(rst), .Q(sec[1]));
    D_FlipFlop  ff_sec2 (.D(sec_next[2]), .clk(clk_1hz), .rst(rst), .Q(sec[2]));
    D_FlipFlop  ff_sec3 (.D(sec_next[3]), .clk(clk_1hz), .rst(rst), .Q(sec[3]));
    D_FlipFlop  ff_sec4 (.D(sec_next[4]), .clk(clk_1hz), .rst(rst), .Q(sec[4]));
    D_FlipFlop  ff_sec5 (.D(sec_next[5]), .clk(clk_1hz), .rst(rst), .Q(sec[5]));

    // Flip-flops for minutes
    D_FlipFlop  ff_min0 (.D(min_next[0]), .clk(clk_1hz), .rst(rst), .Q(min[0]));
    D_FlipFlop  ff_min1 (.D(min_next[1]), .clk(clk_1hz), .rst(rst), .Q(min[1]));
    D_FlipFlop  ff_min2 (.D(min_next[2]), .clk(clk_1hz), .rst(rst), .Q(min[2]));
    D_FlipFlop ff_min3 (.D(min_next[3]), .clk(clk_1hz), .rst(rst), .Q(min[3]));
    D_FlipFlop  ff_min4 (.D(min_next[4]), .clk(clk_1hz), .rst(rst), .Q(min[4]));
    D_FlipFlop  ff_min5 (.D(min_next[5]), .clk(clk_1hz), .rst(rst), .Q(min[5]));

    // Logic for next second and minute values
    assign sec_next = (sec == 59) ? 0 : sec + 1;  // Reset seconds to 0 when reaching 59
    assign min_next = (sec == 59) ? ((min == 59) ? 0 : min + 1) : min;  // Increment minutes when seconds reset
endmodule
// Full Adder Dataflow Implementation


module BitAdder (
    input [15:0] A,
    input [15:0] B,
    input cin,
    output [15:0] sum,
    output cout
);
    wire [15:0] carry;

    FullAdderDataflow fa0 (.a(A[0]), .b(B[0]), .cin(cin),     .sum(sum[0]), .cout(carry[0]));
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin : adder_chain
            FullAdderDataflow fa (.a(A[i]), .b(B[i]), .cin(carry[i-1]), .sum(sum[i]), .cout(carry[i]));
        end
    endgenerate

    assign cout = carry[15];
endmodule


// 32-bit Logical Adder using Full Adders (Dataflow)
module LogicalAdderDataflow (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [31:0] carry;

    // Dataflow modeling for 32-bit addition
    assign {carry[30:0], sum[0]} = a[0] ^ b[0];  // First bit sum
    assign carry[0] = a[0] & b[0];                // First bit carry

    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin: full_adder_chain
            // Dataflow modeling for each bit
            assign sum[i] = a[i] ^ b[i] ^ carry[i-1]; // Sum using XOR
            assign carry[i] = (a[i] & b[i]) | (carry[i-1] & (a[i] ^ b[i])); // Carry logic
        end
    endgenerate
endmodule


// 32-bit Multiplier Dataflow Implementation
module FullAdderDataflow (
    input a,          // First input
    input b,          // Second input
    input cin,        // Carry input
    output sum,       // Sum output
    output cout       // Carry output
);
    assign sum = a ^ b ^ cin;          // Sum using XOR
    assign cout = (a & b) | (cin & (a ^ b)); // Carry using AND and OR
endmodule

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
                assign partial_product[i][j] = A[j] & B[i];  // AND operation for each bit
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
                    FullAdderDataflow fa (
                        .a(partial_product[i][j]),
                        .b(sum[i-1][j]),
                        .cin(1'b0),
                        .sum(sum[i][j]),
                        .cout(carry[i][j])
                    );
                end else begin
                    // Handle the other bits with carry-in
                    FullAdderDataflow fa (
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
```
</details>
<details>

	

	
 

  <summary>DATAFLOW LEVEL TEST BENCH CODE </summary>
	
 ```verilog
	
    module step_comparison_tb;
    reg clk;
    reg rst;
    reg [7:0] hr_input_1, hr_input_2;
    reg [2:0] steps_per_second_1, steps_per_second_2;  // Changed to 3-bit to handle values from 1 to 4
    reg [7:0] stride_length_1, stride_length_2;
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
        steps_per_second_1 =0; // Start at 1
        steps_per_second_2 = 0; // Start at 1
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

            // Steps per second pattern for Run 1: 1 → 2 → 3 → 4 → 3 → 2 → 1
            if (direction_steps_1) begin
                steps_per_second_1 = steps_per_second_1 + 1;
                if (steps_per_second_1 == 4) direction_steps_1 = 0; // Start decrementing at 4
            end else begin
                steps_per_second_1 = steps_per_second_1 - 1;
                if (steps_per_second_1 == 1) direction_steps_1 = 1; // Start incrementing at 1
            end

            // Steps per second pattern for Run 2: 1 → 2 → 3 → 4 → 3 → 2 → 1
            if (direction_steps_2) begin
                steps_per_second_2 = steps_per_second_2 + 1;
                if (steps_per_second_2 == 4) direction_steps_2 = 0; // Start decrementing at 4
            end else begin
                steps_per_second_2 = steps_per_second_2 - 1;
                if (steps_per_second_2 == 1) direction_steps_2 = 1; // Start incrementing at 1
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
```

</details>



## Logisim Simplified Circuit Diagram

 

<details>
![Simplified_circuit](https://github.com/user-attachments/assets/fb363ba4-114b-4d21-bdd4-cdc98162ba33)
</details>

## References

<details>
  <summary>Click to view references</summary>

  1. [How to Train with a Heart Rate Monitor](https://www.rei.com/learn/expert-advice/how-to-train-with-a-heart-rate-monitor.html)
  2. [Heart Rate Info](https://tinyurl.com/heartrateinfo)
  3. [Running Watch Buying Guide](https://www.runnersneed.com/expert-advice/gear-guides/running-watch-buying-guide.html)

</details>
