-- example calculator_core implementation

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity calculator_core is port(
	inc, sel : in std_logic;
	aOut : out std_logic_vector(9 downto 0);  -- operand A out 
	bOut : out std_logic_vector(9 downto 0);  -- operand B out 
	opOut: out std_logic_vector(1 downto 0);  -- operation out. 00 = +   01 = -    10 = XOR    11 = AND
	resOut: out std_logic_vector(9 downto 0)  -- (A op B) out 
); 
end calculator_core;

architecture behavioral of calculator_core is

	
begin



end behavioral;