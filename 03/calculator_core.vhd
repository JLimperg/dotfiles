library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity calculator_core is port(
  inc   : in  std_logic;
  sel   : in  std_logic;
  aOut  : out std_logic_vector(9 downto 0); -- operand A out
  bOut  : out std_logic_vector(9 downto 0); -- operand B out
  opOut : out std_logic_vector(1 downto 0); -- operation out. 00 = + | 01 = - | 10 = XOR | 11 = AND
  resOut: out std_logic_vector(9 downto 0)  -- (A op B) out
);
end calculator_core;

architecture behavioral of calculator_core is

  signal state : std_logic_vector(1 downto 0) := "00"; -- state 00 = operand A, 01 = operation, 10 = operand B, 11 = result
  signal ond1  : std_logic_vector(9 downto 0) := "0000000000";
  signal ond2  : std_logic_vector(9 downto 0) := "0000000000";
  signal op    : std_logic_vector(1 downto 0);
  signal res   : std_logic_vector(9 downto 0) := "0000000000";

begin

  process (sel)
  begin
    if sel'EVENT and sel = '1' then  -- Change state
      state <= state + "1";
    end if;
  end process;

  aOut <= ond1;
  bOut <= ond2;

  process(inc, state)
  begin
    if inc'EVENT and inc ='1' then   -- Depending on state either:
      if state = "00" then           -- Increment A
        ond1 <= ond1 + "1";
      elsif state = "01" then        -- Change operator
        op <= op + "1";
      elsif state = "10" then        -- Increment B
        ond2 <= ond2 + "1";
      elsif state = "11" then        -- Calculate result
        if op = "00" then
          res <= ond1 + ond2;
        elsif op = "01" then
          res <= ond1 - ond2;
        elsif op = "10" then
          -- XOR
        elsif op = "11" then
          -- AND
        end if;
      end if;
    end if;
  end process;

  opOut <= op;
  resOut <= res;

end behavioral;
