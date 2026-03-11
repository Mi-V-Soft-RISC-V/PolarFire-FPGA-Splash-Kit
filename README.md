## PolarFire FPGA Splash-Kit

This repository contains the Libero project for AXIS FEE development.


## Design Features
The Libero design includes the following features:
* A soft RISC-V processor operating at 50 MHz
* A RISC-V debug block allowing on-target debug using SoftConsole
* SPI and data interface to ADM00700 ADC eval board (200 MHz DDR)
* LVDS receiver with CDS engine
    * Allows peeking at raw data over APB from Mi-V processor
* Data framing into UDP packet stream to RGMII interface


## Mi-V Memory Map

The peripherals in this design are located at the following addresses.
#### MIV_RV32 based configurations
| Peripheral (MIV_ESS)             | Address Start | Address End    |
| ------------------------------:  |:-------------:|:--------------:|
| UART                             | 0x7100_0000   | 0x71FF_FFFF    |
| CoreTSE                          | 0x7300_0000   | 0x73FF_FFFF    |
| lvds_receiver                    | 0x7400_0000   | 0x74FF_FFFF    |
| GPIO                             | 0x7500_0000   | 0x75FF_FFFF    |
| SPI                              | 0x7600_0000   | 0x76FF_FFFF    |
| pixel_engine                     | 0x7B00_0000   | 0x7BFF_FFFF    |
| SRAM                             | 0x8000_0000   | 0x8000_7FFF    |


## Running the Project

* From Libero:
    * Project -> Execute Script -> Choose Libero_Projects/demo.tcl
        * This will build the design based on the tcl scripts and hdl in this repository
        * This will also run Synthesis, Place and Route, and Verify Timing
    * From the Design Flow tab, right click Run PROGRAM Action and click Run
* Connect over CoolTerm or another serial terminal (115200 baud rate, 8-N-1)
* On power on, the FPGA will print a welcome message and then wait for commands
* Some useful commands are:
    * spi read 0x15c (read lower byte of ADC whoami register; it should read 0x70)
    * spi write 0x62 0x1d (enable the 0x55aa test ADC output)
    * gpio 0 tog (toggle gpio 0, which will enable ADC readout for a short time and fill memory with data)
    * mem read 0x74000000 32 (read some of the memory that should have just been filled with 0x55aa)
    * gpio 0 on (enable the ADC data stream over ethernet)



## Target Hardware
Details of the PolarFire FPGA Splash-Kit and its features can be found:
* [MPF300-SPLASH-KIT](https://www.microchip.com/en-us/development-tool/MPF300-SPLASH-KIT)


## Design Tools
The following design tools are required.


### Libero SoC v2025.1
[Libero SoC](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/libero-software-later-versions#downloads) is Microchip's FPGA design software. Please note the [Memory Map Generation DRC](https://onlinedocs.microchip.com/oxy/GUID-AFCB5DCC-964F-4BE7-AA46-C756FA87ED7B-en-US-15/GUID-0FECE76C-AF5E-461A-A9AF-969F95712EFB.html) feature is downgraded in the Mi-V sample designs.

### CoolTerm
[CoolTerm](https://freeware.the-meiers.org/) or any other serial terminal is useful for sending and receiving written commands to the FPGA.

### SoftConsole
[SoftConsole](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/soc-fpga/softconsole) is Microchip’s free software development environment facilitating the rapid development of bare-metal and RTOS based C/C++ software for Microchip CPU and SoC based FPGAs. It provides development and debug support for all Microchip SoC FPGAs and 32-bit soft IP CPUs. SoftConsole can be downloaded.

### Mi-V Soft processor Bare Metal Examples
A [Firmware](https://mi-v-ecosystem.github.io/_redirects/mi-v-soft-risc-v/miv-rv32-bare-metal-examples)
repository that provides bare metal embedded software example projects built with Microchip's SoftConsole IDE.
