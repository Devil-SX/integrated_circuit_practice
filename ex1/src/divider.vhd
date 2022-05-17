-- --分频器
-- in:
-- clk 输入时钟信号
-- out:
-- div_10	输出十分频信号
-- div_100	输出100分频信号
-- div_1000	输出1000分频信号
library ieee;
use ieee.std_logic_1164.all;

entity divider is
port(
	clk: in std_logic;
	div_10: out std_logic;
	div_100: out std_logic;
	div_1000: out std_logic
);
end entity;

architecture rtl of divider is

	component divider_10
	port (
		clk: in std_logic;
		clk_div: out std_logic
	);
	end component;

	signal temp_10:std_logic;
	signal temp_100:std_logic;
	signal temp_1000:std_logic;
begin

	layer_1:divider_10 port map (
		clk=>clk,
		clk_div=>temp_10
	);
	layer_2:divider_10 port map(
		clk=>temp_10,
		clk_div=>temp_100
	);
	layer_3:divider_10 port map(
		clk=>temp_100,
		clk_div=>temp_1000
	);
	
	process(clk)
	begin
		div_10<=temp_10;
		div_100<=temp_100;
		div_1000<=temp_1000;
	end process;

end architecture;