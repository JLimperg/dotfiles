library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity stopwatch_tst is
end stopwatch_tst;

architecture tst of stopwatch_tst is

  signal clk_50    : std_logic;
  signal startStop : std_logic := '1';
  signal rst       : std_logic := '1';
  signal countOut  : std_logic_vector(5 downto 0) := "000000";

  component myCounter is
    port (
      clk_50    : in  std_logic;
      startStop : in  std_logic;
      rst       : in  std_logic;
      countOut  : out std_logic_vector(5 downto 0)
    );
  end component;

begin

  i1 : myCounter port map (
    clk_50 => clk_50,
    rst => rst,
    startStop => startStop,
    countOut => countOut
  );

  init : process
  begin
    rst <= '0';
    wait for 40 ns;
    rst <= '1';
    wait for 40 ns;

    startStop <= '0';
    wait for 40 ns;
    startStop <= '1';
    wait for 40 ns;

    for i in 0 to 500 loop
	   if i mod 2 = 0 then
		  clk_50 <= '0';
		else
		  clk_50 <= '1';
		end if;
		wait for 10 ns;
	 end loop;

    startStop <= '0';
    wait for 40 ns;
    startStop <= '1';
    wait for 40 ns;

    rst <= '0';
    wait for 40 ns;
    rst <= '1';
    wait for 40 ns;

     startStop <= '0';
    wait for 40 ns;
    startStop <= '1';
    wait for 40 ns;

	 for i in 0 to 500 loop
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
