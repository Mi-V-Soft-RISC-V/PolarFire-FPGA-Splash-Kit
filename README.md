## PolarFire FPGA Splash-Kit Mi-V Sample Designs

This repository contains Libero projects for the following soft core RISC-V processors:
* MIV_RV32 (**M**|**C**|**F**)
* MIV_RV32IMA_L1_AHB * 
* MIV_RV32IMA_L1_AXI * 
* MIV_RV32IMAF_L1_AHB *

\*Legacy cores. MIV_RV32 recommended for new designs

FlashPro Express projects containing pre-generated programming files are also available for each of the designs.

To download or clone the repository:

    $ git clone https://github.com/Mi-V-Soft-RISC-V/PolarFire-FPGA-Splash-Kit.git

    $ Running from the zipped sources
    1. Download the zipped sources via the "Code" button using "Download Zip" button
    2. Unzip the sources


# Libero Projects
The Libero_Projects folder contains [sample Mi-V Libero designs](Libero_Projects) for Libero SoC v2023.1. Libero projects for older Libero releases can be downloaded from their [tags](https://github.com/Mi-V-Soft-RISC-V/PolarFire-FPGA-Splash-Kit/releases) in this repository.

## Design Features
The Libero designs include the following features:
* A soft RISC-V processor operating at 50 MHz
* A RISC-V debug block allowing on-target debug using SoftConsole
* An Extended Subsystem with integrated peripherals
* Target SRAM/TCM memory (32kB)
* User peripherals: MIV_ESS, 2 Timers, UART, 2 GPIO Inputs and 4 GPIO Outputs (GPIOs use fixed configs for simplicity and better resource utilization)

## Target Hardware
Details of the PolarFire FPGA Splash-Kit and it's features can be found:
* [MPF300-SPLASH-KIT](https://www.microchip.com/en-us/development-tool/MPF300-SPLASH-KIT)

# FlashPro Express
The FlashPro_Express_Projects folder contains the pre-generated programming files, which can be downloaded directly to the target board using FlashPro Express.

# Design Tools
The following design tools are required.

## Libero SoC v2023.1
[Libero SoC](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/libero-software-later-versions#downloads) is Microchip's FPGA design software.

## FlashPro Express
[FlashPro Express](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/programming-and-debug/flashpro-and-flashpro-express#software) is Microchip's Programming and debug tool. It is included in the Libero SoC software and is also
available as a standalone application. Please note, that if Libero SoC is already on your system, you do not need
the standalone version.

# Software

## SoftConsole
[SoftConsole](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/soc-fpga/softconsole) is Microchip’s free software development environment facilitating the rapid development of bare-metal and RTOS based C/C++ software for Microchip CPU and SoC based FPGAs. It provides development and debug support for all Microchip SoC FPGAs and 32-bit soft IP CPUs. SoftConsole can be downloaded.

## Mi-V Soft processor Bare Metal Examples
A [Firmware](https://mi-v-ecosystem.github.io/_redirects/mi-v-soft-risc-v/miv-rv32-bare-metal-examples)
repository that provides bare metal embedded software example projects built with Microchip's SoftConsole IDE.
