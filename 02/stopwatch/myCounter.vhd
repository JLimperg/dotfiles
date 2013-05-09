library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity myCounter is port(
  clk_50    : in  std_logic;                     -- 50 mhz clock input
  startStop : in  std_logic;                     -- start-stop signal
  rst       : in  std_logic;                     -- reset signal (active low)
  countOut  : out std_logic_vector(5 downto 0)); -- 6 bit counter signal
end myCounter;

architecture behavioral of myCounter is

  signal ct      : std_logic_vector(5 downto 0) := "000000"; -- internal stopwatch counter
  signal started : std_logic                    := '0';      -- 1 if stopwatch is running, 0 otherwise
  
  signal clk_1_out : std_logic; -- 1Hz clock
  
  component clk_1 is port (
    clk_50  : in  std_logic;
    clk_out : out std_logic
  );
  end component;

begin

  clk : clk_1 port map (
    clk_50  => clk_50,
    clk_out => clk_1_out
  );

  process (rst, clk_1_out)
  begin
    if rst = '0' then
      ct <= "000000";
    elsif started = '1' then
      if clk_1_out'event and clk_1_out = '1' then
        ct <= ct + '1';
      end if;
    end if;
  end process;

  process (startStop)
  begin
    if startStop = '0' then
      started <= not started;
    end if;
  end process;

  countOut <= ct;

end behavioral;