# DIGITAL-CLOCKS-STIMULATION

## Project Description
A 12-hour digital clock system implemented on FPGA using Verilog. [cite_start]It features a user-friendly interface with switches and buttons to manage various timekeeping modes displayed on 7-segment LEDs[cite: 639, 651].

## Operational Modes
1. [cite_start]**Real-time Clock**: Accurate 12-hour display with AM/PM indicators[cite: 640, 722].
2. [cite_start]**Set Time**: Allows manual configuration of Hours, Minutes, and AM/PM[cite: 641, 727].
3. [cite_start]**Stopwatch**: Count-up timer with Start/Pause/Resume functionality[cite: 642, 770].
4. [cite_start]**Countdown**: Programmable timer that counts down to zero with stop/resume support[cite: 643, 834].

## Design Hierarchy
- [cite_start]`clock_divider`: Generates precise 1Hz and 10Hz pulses[cite: 732, 779].
- [cite_start]`time_counter`: Core logic for timekeeping and mode transitions[cite: 747].
- [cite_start]`binary_to_bcd`: Converts 16-bit registers for 7-segment display[cite: 741, 844].
- [cite_start]`display_controller`: Manages multiplexing for 6x 7-segment LED modules[cite: 744, 847].
