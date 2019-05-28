library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Computer is
port(
	clock : in std_logic;
	visual : out std_logic_vector(15 downto 0);
	visual3 : out std_logic_vector(22 downto 0);
	v : out std_logic_vector(15 downto 0);
	dis1, dis2, dis3, dis4 : out std_logic_vector(6 downto 0)
	
);
end Computer;

architecture arc_Computer of Computer is

component procesador is
	port(
		reloj : in std_logic;
		info : out std_logic_vector(22 downto 0);
		visual2, visual3, visual4 : out std_logic_vector(15 downto 0);
		sigread, sigwrite : out std_logic;
		address : out std_logic_vector(15 downto 0);
		data : out std_logic_vector(19 downto 0);
		outdata : in std_logic_vector(19 downto 0)
	);
end component;

component memory is
	port(
		clk : in std_logic;
		sigread, sigwrite : in std_logic;
		address : in std_logic_vector(15	downto 0);
		data : in std_logic_vector(19 downto 0);
		outdata : out std_logic_vector(19 downto 0)
	);
end component;

component decoder is
port(
	clck : in std_logic;
	number : in std_logic_vector(15 downto 0);
	display1, display2, display3, display4 : out std_logic_vector(6 downto 0);
	vs : out std_logic_vector(15 downto 0)
);
end component;


signal memread, memwrite : std_logic;
signal direccion : std_logic_vector(15 downto 0);
signal datos : std_logic_vector(19 downto 0);
signal instruccion : std_logic_vector(19 downto 0);

signal rs : std_logic_vector(15 downto 0);

begin

Memoria: memory
	port map(
		clk => clock,
		sigread => memread,
		sigwrite => memwrite,
		address => direccion,
		data => datos,
		outdata => instruccion
	);

ProcesadorComp: procesador
	port map(
		reloj => clock,
		info => visual3,
		visual2 => rs,
		--visual3 => visuall,
		--visual4 => visualll,
		sigread => memread,
		sigwrite => memwrite,
		address => direccion,
		data => datos,
		outdata => instruccion
	);
	
	Decodificador: decoder
	port map(
		clck => clock,
		number => rs,
		display1 => dis1,
		display2 => dis2,
		display3 => dis3,
		display4 => dis4
		-- vs => v -- Primer numero a decodificar
	);
	
	visual <= rs;
	
end arc_Computer;