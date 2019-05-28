library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity mux2 is
port(
	sgn : in std_logic;
	first, second : in std_logic_vector(15 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end mux2;

architecture arc_mux2 of mux2 is
begin
	process(sgn, first, second) is
	begin
		if (sgn = '0') then
			salida <= first;
		elsif (sgn = '1') then
			salida <= second;
		end if;
	end process;
end arc_mux2;