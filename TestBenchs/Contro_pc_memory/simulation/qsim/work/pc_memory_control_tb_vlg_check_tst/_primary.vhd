library verilog;
use verilog.vl_types.all;
entity pc_memory_control_tb_vlg_check_tst is
    port(
        flagv           : in     vl_logic;
        info            : in     vl_logic_vector(22 downto 0);
        regvisual       : in     vl_logic_vector(3 downto 0);
        v3              : in     vl_logic_vector(15 downto 0);
        v4              : in     vl_logic_vector(15 downto 0);
        visual          : in     vl_logic_vector(15 downto 0);
        visual2         : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end pc_memory_control_tb_vlg_check_tst;
