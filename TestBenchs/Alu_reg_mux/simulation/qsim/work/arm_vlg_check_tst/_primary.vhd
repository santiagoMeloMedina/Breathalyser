library verilog;
use verilog.vl_types.all;
entity arm_vlg_check_tst is
    port(
        visual          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end arm_vlg_check_tst;
