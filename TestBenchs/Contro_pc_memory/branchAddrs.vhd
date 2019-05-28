library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity branchAddrs is
port(
	addrs : in std_logic_vector(15 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end branchAddrs;

architecture arc_branchAddrs of branchAddrs is
begin
	process(addrs) is
	begin
		salida <= addrs+"";
	end process;
end arc_branchAddrs;