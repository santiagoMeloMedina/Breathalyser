library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity cu is
port(
	reloj : in std_logic;
	code : in std_logic_vector(3 downto 0);
	info : out std_logic_vector(22 downto 0)
);
end cu;

architecture arc_cu of cu is

component control is
	port(
		clock : in std_logic;
		sigs : out std_logic_vector(22 downto 0);
		opcode : in std_logic_vector(3 downto 0);
		mdr : out std_logic;
		dz : out std_logic;
		aow : out std_logic;
		br : out std_logic;
		pw : out std_logic;
		id : out std_logic;
		mr : out std_logic;
		mw : out std_logic;
		mtr : out std_logic;
		iw : out std_logic;
		aA : out std_logic;
		rw : out std_logic;
		rd : out std_logic;
		ps: out std_logic_vector(2 downto 0);
		aB: out std_logic_vector(2 downto 0);
		ap : out std_logic_vector(3 downto 0)
		
	);
end component;

begin

ControlUnit : control
	port map(
		clock => reloj,
		opcode => code,
		sigs => info
	);
end arc_cu;
