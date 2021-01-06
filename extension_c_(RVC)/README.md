# 4-stage RISC-V Core (RVC)
  - This repository contains the logic for decompression of a compressed 16-bit instruction used in the RISC-V extension 'C', also known as RVC.
  - It is developed in [TL-Verilog](http://tl-x.org/) using [Makerchip](https://makerchip.com/).
  - To be verify the decompression and decoder logic, inputs instruction were provided to the logic manually.
  
# Compressed Instructions
 - RISC-V supports an extension to	reduces static and dynamic code size by adding short 16-bit instruction encodings for common operations. 
 - Each compressed 16-bit instruction can also be represented as an equivalent 32-bit instruction.

Below mentioned are all the 16-bit compressed instruction formats for RISC-V ISA:
 
   <img src="images/rvc_instruction_formats.png" height="600"/>

# Source
  - RISC-V ISA Manual: https://github.com/riscv/riscv-isa-manual/
