library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity am is
port(
	Ain, Bin : in std_logic_vector(15 downto 0);
	operation : in std_logic_vector(3 downto 0);
	visual : out std_logic_vector(15 downto 0)
);
end am;

architecture arc_am of am is

signal A, B, muxAAlu, muxBAlu : std_logic_vector(15 downto 0);

component ALU is
port(
	first, second : in std_logic_vector(15 downto 0);
	sig : in std_logic_vector(3 downto 0);
	result : out std_logic_vector(15 downto 0);
	flag : out std_logic
);
end component;

component mux2 is
port(
	sgn : in std_logic;
	first, second : in std_logic_vector(15 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end component;

component mux4 is
port(
	sgn : in std_logic_vector(2 downto 0);
	first, second, third, fourth : in std_logic_vector(15 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end component;

component Static is
port(
	sin : in std_logic_vector(15 downto 0);
	sout : out std_logic_vector(15 downto 0)
);
end component;

begin

AStatic: Static
	port map(
		sin => Ain,
		sout => A
	);

BStatic: Static
	port map(
		sin => Bin,
		sout => B
	);

AAlu: mux2
	port map(
		sgn => '1',
		first => "0000000000000000",
		second => A,
		salida => muxAAlu
	);

BAlu: mux4
	port map(
		sgn => "000",
		first => B,
		second => "0000000000000001",
		third => "0000000000000000",
		fourth => "0000000000000000",
		salida => muxBAlu
	);
	
AluComp: ALU
	port map(
		sig => operation,
		first => muxAAlu,
		second => muxBAlu,
		result => visual
	);

end arc_am;