library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_1_tst is
end clk_1_tst;

architecture tst of clk_1_tst is

  signal clk_50  : std_logic;
  signal clk_out : std_logic;

  component clk_1 is port (
    clk_50  : in  std_logic;
    clk_out : out std_logic
  );
  end component;

begin

  i1 : clk_1 port map (
    clk_50  => clk_50,
    clk_out => clk_out
  );

  init : process
    variable i : integer := 0;
  begin

    for i in 0 to 100 loop
	   if i mod 2 = 0 then
		  clk_50 <= '0';
		else
		  clk_50 <= '1';
		end if;
		wait for 10 ns;
	 end loop;

    wait;
  end process init;

end tst;
