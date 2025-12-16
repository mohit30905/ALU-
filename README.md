# Arithmetic Logic Unit (ALU) Design Using Verilog

## Overview
This project implements a **4-bit Arithmetic Logic Unit (ALU)** using **Verilog HDL**.  
The ALU is designed with a **modular RTL architecture** and supports arithmetic, logical, and shift operations along with comprehensive flag generation. The design is verified through simulation using **Xilinx Vivado**.

This project demonstrates practical knowledge of **Digital Logic Design, RTL Design, and Verilog-based hardware modeling**, targeting core electronics and VLSI roles.

---

## Features
- 4-bit combinational ALU
- Modular design (Arithmetic, Logic, Shift units)
- Two’s complement based subtraction
- Status flag generation
- Fully verified using a custom testbench

---

## Supported Operations

| Opcode (Sel) | Operation |
|-------------|----------|
| 000 | Addition (A + B) |
| 001 | Subtraction (A − B) |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | NOT A |
| 110 | Logical Left Shift |
| 111 | Logical Right Shift |

---

## Flags Description

| Flag Bit | Name | Description |
|--------|------|------------|
| flags[4] | Sign | Indicates sign of the result |
| flags[3] | Zero | Set when the result is zero |
| flags[2] | Overflow | Signed overflow indicator |
| flags[1] | Parity | Odd parity of the result |
| flags[0] | Carry / Borrow | Carry in addition, Borrow in subtraction |

**Note:** In subtraction using two’s complement, **Borrow = NOT(Carry)**.

---

## Project Structure

