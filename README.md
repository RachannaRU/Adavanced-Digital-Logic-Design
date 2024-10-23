# Adavanced-Digital-Logic-Design

This Repository is work of 1.5 years in Digital VLSI Domain. The Folders has all the main verilog files of the RTL design.

## DADDA Multiplier
 This section of the Repository has the RTL design of 8X8 and 16X16 bit multiplier. This work is taken to work backend where cadence tool genus is used to synthesize the desgin to generate syhtesis report. Area, power and delay is studies for the multiplier and obatined the efficient power for the design compared to previous work. The same technical Research paper is written and presented at ICTCS conference. The link of the paper will be provide once it is available online.

## Automatic test pattern generator
This work has the complete study of ATPG which is important part of any IP for random number genration. This work has the design of 3 types of ATPGs and are designed using LFSRs.
The various LFSRs have different architecture where the RTL design is available here. The backend work is done by synthesizing the designs which produced the variable POWER, AREA and DELAY for all LFSRs. There has been tradeoff between these 3 parameters to choose the best architecture and at last BS-SIC architecture is considered as best based on the least switching activities.

## Fast Adders

The four different fast adders (Parallel Prefix):
1. Kogge Stone
2. Ladner Fischer
3. Roy auto synthesis
4. Sum increament
   These adders are already available as carry propagate adders. The work has the development in SUM propagate adders. The objective of this project is to take the entire design through ASIC design flow.

## Projects
This section has the the basic learning and the basic verilog codes along with testbenches.
## SOC (System on chip)

This is Instituitional Research program where we are working on building a SOC of RISC V processor where the various pheripherals are integrated. My work has the work of I2C. This repo contains the main blocks of I2C those are Master and Controller and integrated by generating IP(Intelectual Property). Rest details cannot be disclosed.

## Processor
In this section I I have uploaded the verilog code along with testbench for MIPS32 processor and a 3 stage pipeline processor.
