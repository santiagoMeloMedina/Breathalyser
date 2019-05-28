library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity registerfile is

port(
	clk : in std_logic;
	sign : in std_logic;
	read1, read2, writereg : in std_logic_vector(3 downto 0);
	writedata : in std_logic_vector(15 downto 0);
	regdata1, regdata2, s2 : out std_logic_vector(15 downto 0)
);
end registerfile;

architecture arc_registerfile of registerfile is
type registro is array (0 to 15) of std_logic_vector(15 downto 0);
signal registers: registro := ("0000000000000011", "0000000000000101", others => "0000000000000000");
begin
	process(clk, sign, read1, read2, writereg, writedata, registers) is
	begin
		regdata1 <= registers(to_integer(unsigned(read1)));
		regdata2 <= registers(to_integer(unsigned(read2)));
		if rising_edge(clk) then
			if (sign = '1') then
				registers(to_integer(unsigned(writereg))) <= writedata;
			end if;
		end if;
		s2 <= registers(2);
	end process;
end arc_registerfile;