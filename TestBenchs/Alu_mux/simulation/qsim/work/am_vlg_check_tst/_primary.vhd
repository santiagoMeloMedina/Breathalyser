library verilog;
use verilog.vl_types.all;
entity am_vlg_check_tst is
    port(
        visual          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end am_vlg_check_tst;
