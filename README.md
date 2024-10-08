# Runner's Performance Measuring System

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

    3. **Time Monitoring System:** It includes a stopwatch that activates when the athlete starts their activity. This stopwatch is vital, as multiple components in the system depend on it. 
          continuously tracks the duration of the workout and is essential for calculating key performance metrics, including speed, distance covered, and calories burned. Its integration ensures real-time accuracy and consistency, supporting other features like 
          heartbeat monitoring and the  pedometer. This allows athletes to receive precise feedback on their performance and make informed adjustments during their sessions.

    4. **Alarm System:** An integrated alarm system is triggered when the heart rate enters the red state. This alarm acts as a critical safety feature, alerting the athlete to take immediate action to prevent potential health risks.

    5. **End of Session Summary:** At the conclusion of each workout session, the system provides a comprehensive end-of-session summary. This summary includes:
    - Average heartbeat
    - Peak heartbeat
    - Total distance covered
    - Total steps taken
    - Total calories burnt
    - Total workout duration
    This summary helps athletes analyze their performance, set future goals, and track their progress over time.
</details>

<!-- Third Section -->
## Functional Block Diagram
<details>
  <summary>Detail</summary>
  
  ![Untitled Diagram drawio (4)](https://github.com/user-attachments/assets/75ebc23e-23d5-4789-8b7f-faaf63e81bdf)

  

</details>

<!-- Fourth Section -->
## Working
<details>
  <summary>Detail</summary>

  > Explain how your model works with the help of a functional table (compulsory) followed by the flowchart.
</details>

<!-- Fifth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>

  > Update a neat logisim circuit diagram.
</details>

<!-- Sixth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>

  > Neatly update the Verilog code in code style only.
</details>

## References
<details>
  <summary>Detail</summary>

</details>
