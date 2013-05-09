-- Copyright 2013: Jan Burchard

-- analog_to_buttons
-- converts the reading of the adc into the corresponding button


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity analog_to_buttons is port(
	analogIn : in std_logic_vector(11 downto 0);
	
	button1pressed : out std_logic;
	button3pressed : out std_logic
);
end analog_to_buttons;


architecture behavior of analog_to_buttons is
begin
	button1pressed <= '1' when analogIn < 500 else '0';	
	button3pressed <= '1' when analogIn > 1500 and analogIn < 2000 else '0';
end behavior;