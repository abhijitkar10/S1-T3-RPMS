
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
| 1     | 130      | 3                | 80            | 1           | 3           |
| 2     | 140      | 2                | 80            | 1           | 5           |
| 3     | 160      | 4                | 80            | 1           | 9           |
| 4     | 180      | 3                | 80            | 1           | 12          |
| 5     | 200      | 3                | 80            | 1           | 15          |

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

  ![MAIN MODULE](https://github.com/user-attachments/assets/7ccc6712-a262-4c4c-8192-e855fb85d3f7)

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
<!-- Sixth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

  > Main Code.

  ```verilog
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




```
  > Testbench Code.
```verilog
// Testbench for Step Calculator and Comparator
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
    reg [7:0] previous_hr;          // Previous heart rate for comparison
    reg [1:0] previous_steps;       // Previous steps per second for comparison
    wire [1:0] hr_comparison;       // Output from comparison (higher, lower)
    wire step_feedback;             // Output from comparison (good or go faster)
    real speed;

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

    // Instantiate the HeartRateAndStepComparator module
    HeartRateAndStepComparator comparator (
        .hr_input(hr_input),
        .previous_hr(previous_hr),
        .steps_input(steps_per_second),
        .previous_steps(previous_steps),
        .hr_comparison(hr_comparison),
        .step_feedback(step_feedback)
    );

    // Clock signal generation
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

    // Display function for heart rate comparison
    function [8*20:0] hr_comparison_text;
        input [1:0] comparison;
        begin
            case (comparison)
                2'b00: hr_comparison_text = "Same";
                2'b01: hr_comparison_text = "Higher";
                2'b10: hr_comparison_text = "Lower";
                default: hr_comparison_text = "Unknown";
            endcase
        end
    endfunction

    integer i;  // Loop counter
    reg direction_hr;  // To keep track of heart rate increment or decrement
    reg [2:0] step_pattern_index;  // Step pattern index to cycle through 1 2 3 4 3 2

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        hr_input = 120;
        valid_input = 0;
        stride_length = 75;  // Set stride length to 75 cm
        direction_hr = 1;  // Start with heart rate incrementing
        step_pattern_index = 0;  // Start with the first pattern index
        previous_hr = 120;
        previous_steps = 2;

        // Reset the system
        #10;
        rst = 0;

        // Loop through 20 cycles of incrementing and decrementing heart rate and steps
        for (i = 0; i < 20; i = i + 1) begin
            #10;
            // Adjust heart rate incrementally
            if (direction_hr) begin
                hr_input = hr_input + 10;
                if (hr_input >= 170) direction_hr = 0;  // Start decrementing after reaching 170
            end else begin
                hr_input = hr_input - 10;
                if (hr_input <= 120) direction_hr = 1;  // Start incrementing after reaching 120
            end

            // Steps per second pattern: 2 3 4 3 2
            case (step_pattern_index)
                0: steps_per_second = 2;
                1: steps_per_second = 3;
                2: steps_per_second = 4;
                3: steps_per_second = 3;
                4: steps_per_second = 2;
            endcase

            // Move to the next step pattern
            step_pattern_index = step_pattern_index + 1;
            if (step_pattern_index > 4)
                step_pattern_index = 0;  // Loop back to start of the pattern

            valid_input = 1;
            
            #5;  // Wait for the input to be processed

            // Print heart rate comparison and step feedback
            $display("Heart Rate: %d, Previous HR: %d, Comparison: %s", hr_input, previous_hr, hr_comparison_text(hr_comparison));
            $display("Steps Per Second: %d, Previous Steps: %d, Feedback: %s", steps_per_second, previous_steps, (step_feedback ? "Good" : "Go Faster"));

            // Update previous values for next cycle
            previous_hr = hr_input;
            previous_steps = steps_per_second;

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
```

</details> 

## References
<details>
  <summary>Detail</summary>

  > 1. https://www.rei.com/learn/expert-advice/how-to-train-with-a-heart-rate-monitor.html
  > 2. https://tinyurl.com/heartrateinfo
  > 3. https://www.runnersneed.com/expert-advice/gear-guides/running-watch-buying-guide.html

</details>
