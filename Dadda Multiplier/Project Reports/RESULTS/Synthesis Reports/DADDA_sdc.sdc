# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Wed Jan 24 18:34:06 IST 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design DADDA_16

set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
set_dont_use true [get_lib_cells slow/ADDFHXL]
set_dont_use true [get_lib_cells slow/ADDFXL]
set_dont_use true [get_lib_cells slow/ADDHXL]
set_dont_use true [get_lib_cells slow/AND2XL]
set_dont_use true [get_lib_cells slow/AND3XL]
set_dont_use true [get_lib_cells slow/AND4XL]
set_dont_use true [get_lib_cells slow/AO21XL]
set_dont_use true [get_lib_cells slow/AO22XL]
set_dont_use true [get_lib_cells slow/AOI21XL]
set_dont_use true [get_lib_cells slow/AOI221XL]
set_dont_use true [get_lib_cells slow/AOI222XL]
set_dont_use true [get_lib_cells slow/AOI22XL]
set_dont_use true [get_lib_cells slow/AOI2BB1XL]
set_dont_use true [get_lib_cells slow/AOI2BB2XL]
set_dont_use true [get_lib_cells slow/AOI32XL]
set_dont_use true [get_lib_cells slow/DFFRXL]
set_dont_use true [get_lib_cells slow/DFFSRXL]
set_dont_use true [get_lib_cells slow/MX2XL]
set_dont_use true [get_lib_cells slow/MXI2XL]
set_dont_use true [get_lib_cells slow/MXI4XL]
set_dont_use true [get_lib_cells slow/NAND2BXL]
set_dont_use true [get_lib_cells slow/NAND3BXL]
set_dont_use true [get_lib_cells slow/NAND3XL]
set_dont_use true [get_lib_cells slow/NAND4BBXL]
set_dont_use true [get_lib_cells slow/NOR2BXL]
set_dont_use true [get_lib_cells slow/NOR2XL]
set_dont_use true [get_lib_cells slow/NOR3BXL]
set_dont_use true [get_lib_cells slow/NOR4BBXL]
set_dont_use true [get_lib_cells slow/OAI21XL]
set_dont_use true [get_lib_cells slow/OAI221XL]
set_dont_use true [get_lib_cells slow/OAI2BB2XL]
set_dont_use true [get_lib_cells slow/OAI31XL]
set_dont_use true [get_lib_cells slow/OAI32XL]
set_dont_use true [get_lib_cells slow/OAI33XL]
set_dont_use true [get_lib_cells slow/OR2XL]
set_dont_use true [get_lib_cells slow/OR4XL]
set_dont_use true [get_lib_cells slow/SDFFNSRXL]
set_dont_use true [get_lib_cells slow/SDFFRXL]
set_dont_use true [get_lib_cells slow/SDFFSXL]
set_dont_use true [get_lib_cells slow/SDFFTRXL]
set_dont_use true [get_lib_cells slow/SEDFFTRXL]
set_dont_use true [get_lib_cells slow/SEDFFXL]
set_dont_use true [get_lib_cells slow/TBUFXL]
set_dont_use true [get_lib_cells slow/TLATNSRXL]
set_dont_use true [get_lib_cells slow/TLATNXL]
set_dont_use true [get_lib_cells slow/TLATXL]
set_dont_use true [get_lib_cells slow/XNOR2XL]
set_dont_use true [get_lib_cells slow/XOR2XL]
set_dont_use true [get_lib_cells slow/DFFNSRXL]
set_dont_use true [get_lib_cells slow/DFFSXL]
set_dont_use true [get_lib_cells slow/EDFFXL]
set_dont_use true [get_lib_cells slow/MX4XL]
set_dont_use true [get_lib_cells slow/MXI3XL]
set_dont_use true [get_lib_cells slow/NAND2XL]
set_dont_use true [get_lib_cells slow/SDFFQXL]
set_dont_use true [get_lib_cells slow/SDFFXL]
set_dont_use true [get_lib_cells slow/TLATSRXL]
set_dont_use true [get_lib_cells slow/XNOR3XL]
set_dont_use true [get_lib_cells slow/AOI31XL]
set_dont_use true [get_lib_cells slow/AOI33XL]
set_dont_use true [get_lib_cells slow/DFFQXL]
set_dont_use true [get_lib_cells slow/DFFTRXL]
set_dont_use true [get_lib_cells slow/DFFXL]
set_dont_use true [get_lib_cells slow/MX3XL]
set_dont_use true [get_lib_cells slow/NAND4BXL]
set_dont_use true [get_lib_cells slow/NAND4XL]
set_dont_use true [get_lib_cells slow/NOR4XL]
set_dont_use true [get_lib_cells slow/OA21XL]
set_dont_use true [get_lib_cells slow/OAI22XL]
set_dont_use true [get_lib_cells slow/OAI2BB1XL]
set_dont_use true [get_lib_cells slow/AOI211XL]
set_dont_use true [get_lib_cells slow/EDFFTRXL]
set_dont_use true [get_lib_cells slow/NOR3XL]
set_dont_use true [get_lib_cells slow/SDFFSRXL]
set_dont_use true [get_lib_cells slow/XOR3XL]
set_dont_use true [get_lib_cells slow/INVXL]
set_dont_use true [get_lib_cells slow/OR3XL]
set_dont_use true [get_lib_cells slow/NOR4BXL]
set_dont_use true [get_lib_cells slow/OA22XL]
set_dont_use true [get_lib_cells slow/OAI222XL]
set_dont_use true [get_lib_cells slow/OAI211XL]
