library ieee;
use ieee.std_logic_1164.all;

entity tb is
end entity;

architecture rtl of tb is
	constant time_period: time := 1 us;--产生1Mhz的时钟信号
	signal clk: std_logic := '0';
	signal div_10: std_logic;
	signal div_100: std_logic;
	signal div_1000: std_logic;
	signal div_10000: std_logic;

	component divider
	port(
		clk: in std_logic;
		div_10: out std_logic;
		div_100: out std_logic;
		div_1000: out std_logic;
		div_10000: out std_logic
	);
	end component;
begin

	instant: divider port map
	(
		clk=>clk,
		div_10=>div_10,
		div_100=>div_100,
		div_1000=>div_1000,
		div_10000=>div_10000
	);

	clk_gen:process
	begin
		wait for time_period/2;
		clk <= not clk;
	end process;

end architecture;
