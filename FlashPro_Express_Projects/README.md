# PolarFire FPGA Splash-Kit FPGA Programming Files

This folder contains FlashPro Express v2023.1 projects for the PolarFire FPGA Splash-Kit Mi-V sample designs.

## FlashPro Express
The programming files contained under this folder were exported from the designs in the Libero_Projects folder in this repository. Select the desired programming file (.job) and program your device using FlashPro Express.

## Programming the Device using FlashPro Express
 Before running these steps, connect the FPGA board to the computer using FlashPro5 or Embedded FlashPro and power up the board.

    1. Open FlashPro Express
    2. Select Project -> New Job Project from FlashPro Express Job   
    3. Browse to the programming Job file (.job) using "Browse ...". The Job files are located
       in the FlashPro_Express_Project/Programming_Files directory
    4. Select the Job file, then select "Open"
    5. Select the FlashPro_Express_Project folder (or any folder of your choice) as the project
       location, then select "OK"
    6. The FlashPro Express Job Project is created
    7. Select the "RUN" button; the status bar will change from IDLE to the percentage complete
    8. Once complete the status bar will display "1 PROGRAMMER(S) PASSED"

## Design Features
The Libero designs include the following features:
* A soft RISC-V processor operating at 50 MHz
* A RISC-V debug block allowing on-target debug using SoftConsole
* An Extended Subsystem with integrated peripherals
* Target SRAM/TCM memory (32kB)
* User peripherals: MIV_ESS, 2 Timers, UART, 2 GPIO Inputs and 4 GPIO Outputs (GPIOs use fixed configs for simplicity and better resource utilization)


The peripherals in this design are located at the following addresses.
#### MIV_RV32 based configurations
| Peripheral (MIV_ESS)             | Address Start | Address End    |
| ------------------------------:  |:-------------:|:--------------:|
| PLIC                             | 0x7000_0000   | 0x70FF_FFFF    |
| UART                             | 0x7100_0000   | 0x71FF_FFFF    |
| Timer                            | 0x7200_0000   | 0x72FF_FFFF    |
| CoreTimer_0 / MIV_ESS_APBSLOT3   | 0x7300_0000   | 0x73FF_FFFF    |
| CoreTimer_1 / MIV_ESS_APBSLOT4   | 0x7400_0000   | 0x74FF_FFFF    |
| GPIO                             | 0x7500_0000   | 0x75FF_FFFF    |
| SPI                              | 0x7600_0000   | 0x76FF_FFFF    |
| uDMA                             | 0x7800_0000   | 0x78FF_FFFF    |
| WDOG                             | 0x7900_0000   | 0x79FF_FFFF    |
| I2C                              | 0x7A00_0000   | 0x7AFF_FFFF    |
| MIV_ESS_APBSLOTB_BASE            | 0x7B00_0000   | 0x7BFF_FFFF    |
| MIV_ESS_APBSLOTC_BASE            | 0x7C00_0000   | 0x7CFF_FFFF    |
| MIV_ESS_APBSLOTD_BASE            | 0x7D00_0000   | 0x7DFF_FFFF    |
| MIV_ESS_APBSLOTE_BASE            | 0x7E00_0000   | 0x7EFF_FFFF    |
| MIV_ESS_APBSLOTF_BASE            | 0x7F00_0000   | 0x7FFF_FFFF    |
| SRAM/TCM                         | 0x8000_0000   | 0x8000_7FFF    |


#### Legacy core based configurations:
| Peripheral (Standalone)| Address       |
| ----------------------:|:-------------:|
| CoreUARTapb            | 0x7000_1000   |
| CoreGPIO_IN            | 0x7000_2000   |
| CoreTimer_0            | 0x7000_3000   |
| CoreTimer_1            | 0x7000_4000   |
| CoreGPIO_OUT           | 0x7000_5000   |
| SRAM                   | 0x8000_0000   |