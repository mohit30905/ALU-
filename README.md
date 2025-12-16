# Parameterized Arithmetic Logic Unit (ALU) Using Verilog

## Overview
This project implements a **parameterized-width Arithmetic Logic Unit (ALU)** using **Verilog HDL**.  
The ALU is designed using a **modular RTL architecture** and supports arithmetic, logical, and shift operations. The bit-width of the ALU can be easily modified using a Verilog parameter, making the design **scalable and reusable**.

The design has been **functionally verified using simulation** in **Xilinx Vivado**, demonstrating correct operation for different data widths.

---

## Key Features
- **Parameterized data width** (default: 4-bit)
- Modular RTL design with separate arithmetic, logic, and shift units
- Two’s complement based subtraction
- Status flag generation
- Hardware-efficient design using generate loops
- Fully verified using a custom testbench

---

## Supported Operations

| Opcode (Sel) | Operation |
|-------------|----------|
| `000` | Addition (A + B) |
| `001` | Subtraction (A − B) |
| `010` | AND |
| `011` | OR |
| `100` | XOR |
| `101` | NOT A |
| `110` | Logical Left Shift |
| `111` | Logical Right Shift |

---

## Status Flags

| Flag Bit | Name | Description |
|--------|------|------------|
| `flags[4]` | Sign | Indicates sign of the result (MSB) |
| `flags[3]` | Zero | Set when the result is zero |
| `flags[2]` | Overflow | Signed overflow indicator |
| `flags[1]` | Parity | Odd parity of the result |
| `flags[0]` | Carry / Borrow | Carry in addition, Borrow in subtraction |

**Note:**  
In two’s complement subtraction, **Borrow = NOT(Carry)**.

---

## Parameterization
The ALU width can be changed by modifying the `width` parameter:


## Project Structure
- Alu_top.v
- Arthimetic.v
- logical_shift.v
- alu_tb.v


---

## Design Methodology
- Ripple Carry Adder (RCA) used for arithmetic operations
- Two’s complement method used for subtraction
- Opcode decoding performed in the top-level ALU module
- All outputs (Y and flags) driven only by the top module to avoid multiple drivers

---

## Tools Used
- Verilog HDL
- Xilinx Vivado (XSIM)
- RTL Design Methodology

---

## How to Run the Simulation
1. Open Xilinx Vivado
2. Create a new project
3. Add all `.v` files as Design Sources
4. Add `alu_tb.v` as a Simulation Source
5. Set `Alu` as the RTL top module
6. Set `alu_tb` as the simulation top module
7. Run:  
   **Run Simulation → Run Behavioral Simulation**
8. Observe outputs and flags in the waveform window

---

## Verification
- A self-written Verilog testbench applies multiple test cases
- All operations and flags verified using waveform analysis
- Tested carry, borrow, overflow, and zero-result cases

---

## Learning Outcomes
- Understanding of ALU architecture and RTL design
- Clear distinction between carry and borrow in subtraction
- Experience with modular Verilog coding
- Familiarity with Vivado simulation and debugging
- Insight into how RTL designs are synthesized into hardware

---

## Author
**Mohit**  
Electronics and Communication Engineering  
MNIT Jaipur  

GitHub: https://github.com/mohit30905  
LinkedIn: https://www.linkedin.com/in/mohit-koli-b487b7299  

---

## License
This project is licensed under the MIT License.
