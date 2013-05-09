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
-- Generated on "04/29/2013 15:19:10"
                                                            
-- Vhdl Test Bench template for design  :  csa2
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all;

ENTITY csa2_vhd_tst IS
END csa2_vhd_tst;
ARCHITECTURE csa2_arch OF csa2_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Cout : STD_LOGIC;
SIGNAL Sum : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT csa2
	PORT (
	A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Cout : OUT STD_LOGIC;
	Sum : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : csa2
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	Cout => Cout,
	Sum => Sum
	);
init : PROCESS                                               
-- variable declarations                                     
CONSTANT ZERO:  std_logic_vector := std_logic_vector(to_signed(0, 2));
CONSTANT ONE:   std_logic_vector := std_logic_vector(to_signed(1, 2));
CONSTANT TWO:   std_logic_vector := std_logic_vector(to_signed(2, 2));
CONSTANT THREE: std_logic_vector := std_logic_vector(to_signed(3, 2));
BEGIN                                                        
-- code that executes only once                      
	A <= ZERO;
	B <= ZERO;
	wait for 40 ns;
	A <= ZERO;
	B <= ONE;
	wait for 40 ns;
	A <= ZERO;
	B <= TWO;
	wait for 40 ns;
	A <= ZERO;
	B <= THREE;
	wait for 40 ns;
	A <= ONE;
	B <= ZERO;
	wait for 40 ns;
	A <= ONE;
	B <= ONE;
	wait for 40 ns;
	A <= ONE;
	B <= TWO;
	wait for 40 ns;
	A <= ONE;
	B <= THREE;
	wait for 40 ns;
	A <= TWO;
	B <= ZERO;
	wait for 40 ns;
	A <= TWO;
	B <= ONE;
	wait for 40 ns;
	A <= TWO;
	B <= TWO;
	wait for 40 ns;
	A <= TWO;
	B <= THREE;
	wait for 40 ns;
	A <= THREE;
	B <= ZERO;
	wait for 40 ns;
	A <= THREE;
	B <= ONE;
	wait for 40 ns;
	A <= THREE;
	B <= TWO;
	wait for 40 ns;
	A <= THREE;
	B <= THREE;
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
END csa2_arch;
