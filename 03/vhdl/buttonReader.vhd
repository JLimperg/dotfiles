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



signal adcData : std_logic_vector(11 downto 0);

signal button1State : std_logic_vector(9 downto 0);
signal button3State : std_logic_vector(9 downto 0);

begin
	adc: adcReader port map (clk_50 => clk_50, reset_n => '1', Data0 => adcData, DIN => DIN, CS_n => CS_n, SCLK => SCLK, DOUT => DOUT);
	
	process(clk_50) begin
		if clk_50'event and clk_50 ='1' then
			button1State(9 downto 1) <= button1State(8 downto 0);
			if adcData < 500  then
				button1State(0) <=  '1';
			else
				button1State(0) <=  '0';
			end if;
			
			button3State(9 downto 1) <= button3State(8 downto 0);
			if adcData > 1400 and adcData < 2300  then
				button3State(0) <=  '1';
			else
				button3State(0) <=  '0';
			end if;

		end if;
	end process;
	
	
	button1pressed <= '1' when button1State = "1111111111" else '0';
	button3pressed <= '1' when button3State = "1111111111" else '0';
end structure;