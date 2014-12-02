library verilog;
use verilog.vl_types.all;
entity Lab3_Part1 is
    port(
        SW              : in     vl_logic_vector(17 downto 0);
        LEDR            : out    vl_logic_vector(17 downto 0);
        LEDG            : out    vl_logic_vector(7 downto 0);
        KEY             : in     vl_logic_vector(1 downto 0)
    );
end Lab3_Part1;
