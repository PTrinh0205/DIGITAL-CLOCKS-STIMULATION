# DIGITAL-CLOCKS-STIMULATION

## Project Description
A 12-hour digital clock system implemented on FPGA using Verilog. It features a user-friendly interface with switches and buttons to manage various timekeeping modes displayed on 7-segment LEDs.

## Operational Modes
1. **Real-time Clock**: Accurate 12-hour display with AM/PM indicators.
2. **Set Time**: Allows manual configuration of Hours, Minutes, and AM/PM.
3. **Stopwatch**: Count-up timer with Start/Pause/Resume functionality.
4. **Countdown**: Programmable timer that counts down to zero with stop/resume support.

## Design Hierarchy
- `clock_divider`: Generates precise 1Hz and 10Hz pulses.
- `time_counter`: Core logic for timekeeping and mode transitions.
- `binary_to_bcd`: Converts 16-bit registers for 7-segment display.
- `display_controller`: Manages multiplexing for 6x 7-segment LED modules.
