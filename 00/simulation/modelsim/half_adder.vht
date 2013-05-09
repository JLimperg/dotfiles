-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/25/2013 21:01:05"
                                                            
-- Vhdl Test Bench template for design  :  half_adder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY half_adder_vhd_tst IS
END half_adder_vhd_tst;
ARCHITECTURE half_adder_arch OF half_adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cout : STD_LOGIC;
SIGNAL in1 : STD_LOGIC;
SIGNAL in2 : STD_LOGIC;
SIGNAL sumout : STD_LOGIC;
COMPONENT half_adder
	PORT (
	cout : OUT STD_LOGIC;
	in1 : IN STD_LOGIC;
	in2 : IN STD_LOGIC;
	sumout : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : half_adder
	PORT MAP (
-- list connections between master ports and signals
	cout => cout,
	in1 => in1,
	in2 => in2,
	sumout => sumout
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
  -- code that executes only once
  in1 <= '0';
  in2 <= '0';
  wait for 40 ns;
  in1 <= '0';
  in2 <= '1';
  wait for 40 ns;
  in1 <= '1';
  in2 <= '0';
  wait for 40 ns;
  in1 <= '1';
  in2 <= '1';
  wait for 40 ns;  
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END half_adder_arch;
