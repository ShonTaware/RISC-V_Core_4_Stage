# 4-stage RISC-V Core

# Table of Contents
  - [Introduction To RISC-V ISA](#Introduction-to-risc-v-isa)
  - [Compiler Toolchain](#compiler-toolchain)
  - [Application Binary Interface](#application-binary-interface)
  - [RTL Design Using TL-Verilog and MakerChip](#rtl-design-using-tl-verilog-and-makerchip)
  - [Basic RISC-V Core](#basic-risc-v-core)
  - [Pipelined RISC-V Core](#pipelined-risc-v-core)
  - [Acknowledgement](#acknowledgement)

# Introduction To RISC-V ISA
RISC-V is a new ISA that's available under open, free and non-restrictive licences. RISC-V ISA delivers a new level of free, extensible software and hardware freedom on architecture.

  ## Why RISC-V?
  - Far simple and smaller than commercial ISAs.
  - Avoids micro-architecture or technology dependent features.
  - Small standard base ISA.
  - Multiple Standard Extensions.
  - Variable-length instruction encoding

  For more information about [RISC-V ISA](https://github.com/riscv/riscv-isa-manual)
 
# Compiler Toolchain
Toolchain simply is a set of tools used to compile a piece of code to produce a executable program. Similar to other ISAs RISC-V also has its own toolchain. 
Mentioned below are steps to use RISC-V toolchain

  ### Using RISC-V Complier:
    riscv64-unknown-elf-gcc -<compiler options> -mabi=<ABI options> -march=<Architecture options> -o <object filename> <C Program filename>
  - \<compiler options\>    : O1, Ofast
  - \<ABI options\>         : lp64, lp32
  - \<Architecture options\>: RV64, RV32
  
  ### Viewing the assembly language code:
    riscv64-unknown-elf-objdump -d <object filename>
  
  ### Simulating the object file using SPIKE simulator:
    spike pk <object filename>
    
  ### Debugging the object file using SPIKE:
    spike -d pk <object Filename>

Below images show the toolchain implementaion for a small c program for sum of first 9 positive integers.
  1. RISC-V Toolchain: Compilation, Simulation and Debugging
      ![riscv_toolchain](Day2/d2_ss2.JPG)
      
  2. Viewing the assembly language code for generated object file.
      ![assembly_code](Day2/d2_ss1.JPG)

# Application Binary Interface
Every application program runs in a particular environment, which "Application Execution Environment". How the application interfaces with the underlying execution environment is called the "Application Binary Interface (ABI)". 

The Application Binary Interface is the sum total of what the application programmer needs to understand in order to write programs; the programmer does not have to understand or know what is going on within the Application Execution Environment.

An Application Binary Interface would combine the processor ISA along with the OS system-call interface. The below images gives the list of registers, thier short description and ABI name of every register in RISC-V ISA.
 
   <img src="images/abi_names.JPG" height="600"/>

# RTL Design Using TL-Verilog and MakerChip

# Basic RISC-V Core

# Pipelined RISC-V Core
