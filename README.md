

# 🚦 Traffic Light Controller - Verilog Project

This project implements a **Traffic Light Controller** using **Verilog HDL**, simulating a smart traffic system managing four signal groups: `M1`, `M2`, `MT`, and `S`. The design uses a finite state machine (FSM) to control traffic light transitions based on defined timing cycles. A testbench is included for full simulation and verification.

---

## 📁 Files Included

- `Traffic_Light_Controller.v` — Main Verilog module implementing the FSM-based traffic light logic.
- `Traffic_Light_Controller_TB.v` — Testbench for simulating and verifying the controller.
- `traffic_light_controller.vcd` — Waveform output file (generated during simulation).

---

## 🔧 Project Overview

- **Design Style**: FSM (Finite State Machine)
- **Inputs**:
  - `clk`: Clock signal (1 Hz)
  - `rst`: Active-high reset
- **Outputs**:
  - `light_M1`, `light_M2`, `light_MT`, `light_S`: 3-bit outputs (001 = Green, 010 = Yellow, 100 = Red)

### State Timing and Behavior

| State | Description                         | Duration |
|-------|-------------------------------------|----------|
| S1    | M1 + M2: Green, MT + S: Red         | 7 sec    |
| S2    | M2: Yellow                          | 2 sec    |
| S3    | MT: Green                           | 5 sec    |
| S4    | MT: Yellow                          | 2 sec    |
| S5    | S: Green                            | 3 sec    |
| S6    | All Red                             | 2 sec    |

---

## 🚀 How to Run the Simulation

1. **Install a Verilog simulator** like:
   - [Icarus Verilog](http://iverilog.icarus.com/)
   - ModelSim
   - Vivado Simulator

2. **Compile and simulate**:
   ```bash
   iverilog -o traffic_sim Traffic_Light_Controller.v Traffic_Light_Controller_TB.v
   vvp traffic_sim
✅ Features
Finite State Machine design

Real-time simulation (1s per state change cycle)

Synchronized reset logic

VCD waveform generation for debugging and visualization

  📌 Notes
All time units are in nanoseconds with 1ns / 1ps precision.

Each simulation cycle corresponds to 1 real-time second.

Modify the state durations or signal definitions to fit custom traffic needs.

