library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

entity display_data is port (
	clk_50: in std_logic;
	
	-- data inputs
	aIn  : in std_logic_vector(9 downto 0);
	bIn  : in std_logic_vector(9 downto 0);
	opIn : in std_logic_vector(1 downto 0);
	resIn: in std_logic_vector(9 downto 0);
	
	-- lcd connections
	rs : out std_logic;
	e : out std_logic;
  
	dataOut : out std_logic_vector(7 downto 0)	
);
end display_data;


architecture structure of display_data is

component data_to_lcd is port(
	clk: in std_logic;
	
	aIn  : in std_logic_vector(9 downto 0);
	bIn  : in std_logic_vector(9 downto 0);
	opIn : in std_logic_vector(1 downto 0);
	resIn: in std_logic_vector(9 downto 0);
		
	-- connection to lcd module
	lcd_ready: in std_logic;
	lcd_data: out std_logic_vector(7 downto 0);
	lcd_posX: out std_logic_vector(4 downto 0);
	lcd_posY: out std_logic_vector(1 downto 0);
	lcd_write_n: out std_logic;
	lcd_clear_n: out std_logic
);
end component;


component lcd_driver is port(
  clk : in std_logic;
  rst_n : in std_logic;
  
  -- to write data to the display, wait till it is ready, than pull down write_n
  dataIn: in std_logic_vector(7 downto 0);
  posX: in std_logic_vector(4 downto 0);  
  posY : in std_logic_vector(1 downto 0);
  write_n: in std_logic;  -- write data to position
  clear_n : in std_logic;  -- clears the display
  
  rs : out std_logic;
  -- rw : out std_logic; (rw pin on LCD is not used at the time, enable if needed)
  e : out std_logic;
  
  rdy : out std_logic;
  
  dataOut : out std_logic_vector(7 downto 0)
);
end component;

signal lcd_x: std_logic_vector(4 downto 0);
signal lcd_y: std_logic_vector(1 downto 0);
signal lcd_write_n: std_logic;
signal lcd_clear_n: std_logic;
signal lcd_ready  : std_logic;
signal lcd_data   : std_logic_vector(7 downto 0);

begin

dtl: data_to_lcd port map(
	clk => clk_50, 
	aIn => aIn, 
	bIn => bIn, 
	opIn => opIn, 
	resIn => resIn, 
	lcd_ready => lcd_ready, 
	lcd_data=> lcd_data, 
	lcd_posX => lcd_x, 
	lcd_posY => lcd_y,
	lcd_write_n => lcd_write_n,
	lcd_clear_n => lcd_clear_n
);

lcd_driv: lcd_driver port map(
clk => clk_50,
  rst_n => '1',
  dataIn => lcd_data,
  posX => lcd_x, 
  posY => lcd_y, 
  write_n => lcd_write_n,
  clear_n => lcd_clear_n,
  rs => rs,
  e => e,  
  rdy => lcd_ready,  
  dataOut => dataOut
);

end structure;