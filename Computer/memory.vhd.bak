library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity memory is
port(
	clk : in std_logic;
	sigread, sigwrite : in std_logic;
	address : in std_logic_vector(15	downto 0);
	data : in std_logic_vector(19 downto 0);
	outdata : out std_logic_vector(19 downto 0)
);
end memory;

architecture arc_memory of memory is
type espacio is array (0 to 64) of std_logic_vector(19 downto 0);
signal ins_mem: espacio := ("00000000000000000000",
"11001111000000000100", "11001111000100000000", "11001111001000000000",
"11001111001100000010", "11010000000100001010", "01000001001101000000",
"11000100010000000001", "00100100001000100000", "11000001000100000001",
"11100000000000000101", "11011111111100001010",
 35 => "00000000000000000011", others => "00000000000000000000");
begin
	process (clk, sigread, sigwrite, address, data, ins_mem) is
	begin
		outdata <= "00000000000000000000";
		if (sigread = '1') then
			outdata <= ins_mem(to_integer(unsigned(address(5 downto 0))));
		end if;
		if falling_edge(clk) then
			if (sigwrite = '1') then
				ins_mem(to_integer(unsigned(address(5 downto 0)))) <= data;
			end if;
		end if;
	end process;
end arc_memory;