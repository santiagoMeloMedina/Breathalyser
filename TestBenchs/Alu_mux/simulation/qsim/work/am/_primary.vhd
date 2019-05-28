library verilog;
use verilog.vl_types.all;
entity am is
    port(
        Ain             : in     vl_logic_vector(15 downto 0);
        Bin             : in     vl_logic_vector(15 downto 0);
        operation       : in     vl_logic_vector(3 downto 0);
        visual          : out    vl_logic_vector(15 downto 0)
    );
end am;
