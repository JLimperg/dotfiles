library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity myCounter is
  port (
    count    : in  std_logic; -- count signal: increase counter on rising edge
    rst      : in  std_logic; -- reset signal: set counter to 0 if rst = 0
    countOut : out std_logic_vector(2 downto 0) -- counter output
  );
end myCounter;

architecture behavioral of myCounter is
  signal ct : std_logic_vector(2 downto 0);
begin

  process (rst, count)
  begin
    if rst = '0'
      then ct <= "000";
    elsif count'event and count = '1'
      then ct <= ct + '1';
    end if;
  end process;

  countOut <= ct;
end behavioral;
