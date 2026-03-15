# Traffic Light Controller (TLC) in VHDL 🚦

## Overview
This repository contains a VHDL implementation of a Traffic Light Controller for a standard two-way intersection. The design is based on a synchronous Finite State Machine (FSM) that safely dictates the sequence of the Red, Yellow, and Green lights for two separate traffic directions.

## Architecture & State Machine
The controller operates using a clock (`clk`) and a synchronous `reset` signal. It cycles through four primary states, with programmable delays controlled by an internal counter:

1. **RG (Red - Green):** Direction 1 is Red, Direction 2 is Green.
2. **RY (Red - Yellow):** Direction 1 is Red, Direction 2 is Yellow.
3. **GR (Green - Red):** Direction 1 is Green, Direction 2 is Red.
4. **YR (Yellow - Red):** Direction 1 is Yellow, Direction 2 is Red.

### Timing Constants
The duration of each state can be easily adjusted via the constants defined in the architecture:
* `timeRG`: Duration for Red-Green state.
* `timeRY`: Duration for Red-Yellow state.
* `timeGR`: Duration for Green-Red state.
* `timeYR`: Duration for Yellow-Red state.

## Entity Ports (I/O)

| Port Name | Direction | Type        | Description |
| :---      | :---      | :---        | :---        |
| `clk`     | `in`      | `std_logic` | System clock signal |
| `reset`   | `in`      | `std_logic` | Synchronous reset (Active High) |
| `R1`      | `out`     | `std_logic` | Red light for Direction 1 |
| `Y1`      | `out`     | `std_logic` | Yellow light for Direction 1 |
| `G1`      | `out`     | `std_logic` | Green light for Direction 1 |
| `R2`      | `out`     | `std_logic` | Red light for Direction 2 |
| `Y2`      | `out`     | `std_logic` | Yellow light for Direction 2 |
| `G2`      | `out`     | `std_logic` | Green light for Direction 2 |

## Technologies Used
* **Hardware Description Language:** VHDL

## Author
**Ghader Ali** * GitHub: [@G-ALI007](https://github.com/G-ALI007)
* Role: Telecommunications Engineer & Software Developer
