library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity arm is
port(
	reloj : in std_logic;
	reg1, reg2, reg3 : in std_logic_vector(3 downto 0);
	operation : in std_logic_vector(3 downto 0);
	visual : out std_logic_vector(15 downto 0)
);
end arm;

architecture arc_arm of arm is

signal writeregg : std_logic_vector(3 downto 0);
signal A, B, Ain, Bin, aluout, muxAAlu, muxBAlu, data : std_logic_vector(15 downto 0);

component ALU is
port(
	first, second : in std_logic_vector(15 downto 0);
	sig : in std_logic_vector(3 downto 0);
	result : out std_logic_vector(15 downto 0);
	flag : out std_logic
);
end component;

component mux2_4 is
	port(
		sgn : in std_logic;
		first, second : in std_logic_vector(3 downto 0);
		salida : out std_logic_vector(3 downto 0)
	);
end component;

component mux2 is
port(
	sgn : in std_logic;
	first, second : in std_logic_vector(15 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end component;

component registerfile is
port(
	clk : in std_logic;
	sign : in std_logic;
	read1, read2, writereg : in std_logic_vector(3 downto 0);
	writedata : in std_logic_vector(15 downto 0);
	regdata1, regdata2, s2 : out std_logic_vector(15 downto 0)
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

RegisterComp: registerfile
	port map(
		clk => reloj,
		sign => '1',
		read1 => reg1,
		read2 => reg2,
		writereg => writeregg,
		writedata => data,
		regdata1 => Ain,
		regdata2 => Bin,
		s2 => visual
	);

Ins_Reg: mux2_4
	port map(
		sgn => '1',
		first => reg2,
		second => reg3,
		salida => writeregg
	);

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
		result => aluout
	);

AluOMdr: mux2
	port map(
		sgn => '0',
		first => aluout,
		second => "0000000000000000",
		salida => data
	);

end arc_arm;