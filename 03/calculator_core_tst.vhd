library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity calculator_core_tst is
end calculator_core_tst;

architecture tst of calculator_core_tst is

  signal inc   : std_logic := '0';
  signal sel   : std_logic := '0';
  signal aOut  : std_logic_vector(9 downto 0);
  signal bOut  : std_logic_vector(9 downto 0);
  signal opOut : std_logic_vector(1 downto 0);
  signal resOut: std_logic_vector(9 downto 0);

  component calculator_core
    port (
      inc   : in  std_logic;
      sel   : in  std_logic;
      aOut  : out std_logic_vector(9 downto 0); -- operand A out
      bOut  : out std_logic_vector(9 downto 0); -- operand B out
      opOut : out std_logic_vector(1 downto 0); -- operation out. 00 = + | 01 = - | 10 = XOR | 11 = AND
      resOut: out std_logic_vector(9 downto 0)  -- (A op B) out
    );
  end component;

begin

  i1 : calculator_core port map (
    inc    => inc,
    sel    => sel,
    aOut   => aOut,
    bOut   => bOut,
    opOut  => opOut,
    resOut => resOut
  );

  init : process
  begin
    wait for 40 ns;

    -- increment ond. A to 3
    inc <= '1';
    wait for 40 ns;
    inc <= '0';
    wait for 40 ns;

    inc <= '1';
    wait for 40 ns;
    inc <= '0';
    wait for 40 ns;
    inc <= '1';
    wait for 40 ns;
    inc <= '0';
    wait for 40 ns;

    -- increment ond. B to 2
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;

    inc <= '1';
    wait for 40 ns;
    inc <= '0';
    wait for 40 ns;
    inc <= '1';
    wait for 40 ns;
    inc <= '0';
    wait for 40 ns;

    -- compute result
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;

    -- select op. -
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;

    inc <= '1';
    wait for 40 ns;
    inc <= '0';
    wait for 40 ns;

    -- compute result
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;

    -- select op. xor
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;

    inc <= '1';
    wait for 40 ns;
    inc <= '0';
    wait for 40 ns;

    -- compute result
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;

    -- select op. and
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;

    inc <= '1';
    wait for 40 ns;
    inc <= '0';
    wait for 40 ns;

    -- compute result
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;
    sel <= '1';
    wait for 40 ns;
    sel <= '0';
    wait for 40 ns;

    wait;
  end process init;

end tst;
