library verilog;
use verilog.vl_types.all;
entity cu is
    port(
        reloj           : in     vl_logic;
        code            : in     vl_logic_vector(3 downto 0);
        info            : out    vl_logic_vector(22 downto 0)
    );
end cu;
