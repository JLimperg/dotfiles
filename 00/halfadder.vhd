entity halfadder is port(
  in1, in2     : in  Bit;
  sumout, cout : out Bit
);
end halfadder;

architecture behavior of halfadder is
begin
  sumout <= in1 xor in2;
  cout   <= in1 and in2;
end behavior;
