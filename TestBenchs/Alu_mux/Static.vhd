library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Static is
port(
	sin : in std_logic_vector(15 downto 0);
	sout : out std_logic_vector(15 downto 0)
);
end Static;

architecture arc_Static of Static is
signal stc : std_logic_vector(15 downto 0);
begin
	stc <= sin;
	sout <= stc;
end arc_Static;