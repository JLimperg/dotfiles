-- Copyright 2013: Jan Burchard

-- gets the currently pressed buttons


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity buttonReader is port(
	-- 50 mhz clock
	clk_50 			: in 			std_logic;
	
	-- spi connections:
	DIN				:	out		std_logic;
	CS_n				:	out		std_logic;
	SCLK				:	out		std_logic;
	DOUT				:	 in		std_logic;
	
	-- button signals
	button1pressed : out 		std_logic;
	button3pressed : out 		std_logic
);
end buttonReader;


architecture structure of buttonReader is

component adcReader port(
	clk_50 : in std_logic;  
	reset_n : in std_logic;  -- reset 
	Data0   : out std_logic_vector(11 downto 0);
	Data1   : out std_logic_vector(11 downto 0);
	Data2   : out std_logic_vector(11 downto 0);
	Data3   : out std_logic_vector(11 downto 0);
	Data4   : out std_logic_vector(11 downto 0);
	Data5   : out std_logic_vector(11 downto 0);
	Data6   : out std_logic_vector(11 downto 0);
	Data7   : out std_logic_vector(11 downto 0);	
	-- spi connections:
	DIN				:	out		std_logic;
	CS_n				:	out		std_logic;
	SCLK				:	out		std_logic;
	DOUT				:	 in		std_logic
);
end component;

component analog_to_buttons port(
	analogIn : in std_logic_vector(11 downto 0);
	
	button1pressed : out std_logic;
	button3pressed : out std_logic
);
end component;


signal adcData : std_logic_vector(11 downto 0);

begin
	adc: adcReader port map (clk_50 => clk_50, reset_n => '1', Data0 => adcData, DIN => DIN, CS_n => CS_n, SCLK => SCLK, DOUT => DOUT);
	buttons: analog_to_buttons port map (analogIn => adcData, button1pressed => button1pressed, button3pressed => button3pressed);	
	
end structure;