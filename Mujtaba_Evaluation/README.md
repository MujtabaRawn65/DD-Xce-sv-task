# Implementation of NoC with Ready/Val Interface

This folder contains the files of system verilog implementation of Network on Chip having Ready/Valid Handshake Protocol at the Packet generator interface and its test bench aimed to verify the functionality of the NoC chip along with their protocol.

## Problem 1: Network On Chip Implementation

- **File:** `noc_router.sv`
- **Description:** Build the chip that integrates the NoC datapath and NoC controller along with packet generator in test bench. The top level module of NoC router module is shown in the figure below. The state diagram of controller is also shown below under `State Diagram` section. 

- **File:** `noc_router_tb.sv`
- **Description:** This file used to test the chip or verify its functionality. Random test is implemented in packet generator.

# Run the script or verify the chip
To verify chip, you have to first download the compiler that compiles the system verilog source file e.g: iverilog. To visualize the signal, you have to download the gtkwave waveform visualizer.
- **To make all the builds files:** `make`
- **To run and make the `vcd` script:** `make run prog=<file_with_extension_.vvp>`
- **To clean all the builds:** `make clean`
- **To visualize the vcd file** `gtkwave <file_name_with_extension_.vcd>`

# Top Level Diagram
![Top Level of NoC Chip](docs/top_level_noc.drawio.svg)

# Circuit Diagram
![Circuit Diagram of Datapath and controller](docs/datapath_noc.drawio.svg)

# State Diagram
![State Diagram](docs/state_diagram_noc.drawio.svg)

