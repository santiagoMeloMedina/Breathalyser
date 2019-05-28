library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity instructions is
port(
	sigwrite : in std_logic;
	in_direccion : in std_logic_vector(19 downto 0);
	opcode : out std_logic_vector(3 downto 0); 
	r1, r2, r3 : out std_logic_vector(3 downto 0);
	inmidiate : out std_logic_vector(7 downto 0);
	out_direccion : out std_logic_vector(11 downto 0)
);
end instructions;

architecture arc_instructions of instructions is
begin
	process (sigwrite, in_direccion) is
	begin
		if (sigwrite = '1') then
			opcode <= in_direccion(19 downto 16);
			r1 <= in_direccion(15 downto 12);
			r2 <= in_direccion(11 downto 8);
			r3 <= in_direccion(7 downto 4);
			inmidiate <= in_direccion(7 downto 0);
			out_direccion <= in_direccion(11 downto 0);
		end if;
	end process;
end arc_instructions;