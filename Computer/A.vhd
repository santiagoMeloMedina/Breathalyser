library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Static is
port(
	nuevo : in std_logic_vector(15 downto 0);
	ABstatic : out std_logic_vector(15 downto 0)
);
end Static;

architecture arc_Static of Static is
signal ABtmp : std_logic_vector(15 downto 0);
begin
	process (nuevo) is
	begin
		ABtmp <= nuevo;
		ABstatic <= ABtmp;
	end process;
end arc_Static;