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
-- Generated on "04/29/2013 15:21:20"
                                                            
-- Vhdl Test Bench template for design  :  mux2
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all;

ENTITY mux2_vhd_tst IS
END mux2_vhd_tst;
ARCHITECTURE mux2_arch OF mux2_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL S0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL S1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL \select\ : STD_LOGIC;
SIGNAL result : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT mux2
	PORT (
	result : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	S0 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	S1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	\select\ : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mux2
	PORT MAP (
-- list connections between master ports and signals
	result => result,
	S0 => S0,
	S1 => S1,
	\select\ => \select\
	);
init : PROCESS                                               
-- variable declarations                                     
CONSTANT ZERO:  std_logic_vector := std_logic_vector(to_signed(0, 2));
CONSTANT ONE:   std_logic_vector := std_logic_vector(to_signed(1, 2));
CONSTANT TWO:   std_logic_vector := std_logic_vector(to_signed(2, 2));
CONSTANT THREE: std_logic_vector := std_logic_vector(to_signed(3, 2));
BEGIN

-- select = 1
  S0       <= ZERO;
  S1       <= ZERO;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= ZERO;
  S1       <= ONE;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= ZERO;
  S1       <= TWO;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= ZERO;
  S1       <= THREE;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= ONE;
  S1       <= ZERO;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= ONE;
  S1       <= ONE;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= ONE;
  S1       <= TWO;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= ONE;
  S1       <= THREE;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= TWO;
  S1       <= ZERO;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= TWO;
  S1       <= ONE;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= TWO;
  S1       <= TWO;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= TWO;
  S1       <= THREE;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= THREE;
  S1       <= ZERO;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= THREE;
  S1       <= ONE;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= THREE;
  S1       <= TWO;
  \select\ <= '0';
  wait for 40 ns;
  S0       <= THREE;
  S1       <= THREE;
  \select\ <= '0';
  wait for 40 ns;

-- select = 1

  S0       <= ZERO;
  S1       <= ZERO;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= ZERO;
  S1       <= ONE;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= ZERO;
  S1       <= TWO;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= ZERO;
  S1       <= THREE;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= ONE;
  S1       <= ZERO;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= ONE;
  S1       <= ONE;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= ONE;
  S1       <= TWO;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= ONE;
  S1       <= THREE;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= TWO;
  S1       <= ZERO;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= TWO;
  S1       <= ONE;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= TWO;
  S1       <= TWO;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= TWO;
  S1       <= THREE;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= THREE;
  S1       <= ZERO;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= THREE;
  S1       <= ONE;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= THREE;
  S1       <= TWO;
  \select\ <= '1';
  wait for 40 ns;
  S0       <= THREE;
  S1       <= THREE;
  \select\ <= '1';
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
END mux2_arch;
