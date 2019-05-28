library verilog;
use verilog.vl_types.all;
entity arm is
    port(
        reloj           : in     vl_logic;
        reg1            : in     vl_logic_vector(3 downto 0);
        reg2            : in     vl_logic_vector(3 downto 0);
        reg3            : in     vl_logic_vector(3 downto 0);
        operation       : in     vl_logic_vector(3 downto 0);
        visual          : out    vl_logic_vector(15 downto 0)
    );
end arm;
