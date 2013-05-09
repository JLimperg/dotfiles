library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_1 is port (
  clk_50  : in  std_logic;
  clk_out : out std_logic
);
end clk_1;

architecture behavioral of clk_1 is

  signal ct : integer   := 0;
  signal o  : std_logic := '0';

begin

  clk_out <= o;

  process (clk_50)
  begin
    if clk_50 = '1' then
      ct <= ct + 1;

      if ct = 25000000 then
      --if ct = 25 then
        o  <= not o;
        ct <= 0;
      end if;
    end if;

  end process;

end behavioral;