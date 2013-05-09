library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity myCounter_tst is
end myCounter_tst;

architecture tst of myCounter_tst is

  signal count    : std_logic := '0';
  signal rst      : std_logiC := '1';
  signal countOut : std_logic_vector(2 downto 0);

  component myCounter
    port (
      count    : in  std_logic;
      rst      : in  std_logic;
      countOut : out std_logic_vector(2 downto 0)
    );
  end component;

begin

  i1 : myCounter port map (
    count => count,
    rst => rst,
    countOut => countOut
  );

  init : process
    variable ct : integer;
  begin
    rst   <= '1';

    for ct in 0 to 20 loop
      count <= '0';
      wait for 40 ns;
      count <= '1';
      wait for 40 ns;
    end loop;

    count <= '0';
    wait for 40 ns;

    rst   <= '0';
    wait for 40 ns;

    wait;
  end process init;

end tst;
