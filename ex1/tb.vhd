library ieee;
use ieee.std_logic_1164.all;

entity tb is
end entity;

architecture rtl of tb is
	constant time_period: time := 100 ns;--产生1Mhz的时钟信号
	signal clk: std_logic := '0';
	signal clk_div: std_logic;

	component divider_10 
	port(
		clk : in std_logic;
		clk_div : out std_logic
	);
	end component;
begin

	instant: divider_10 port map
	(
		clk=>clk,
		clk_div=>clk_div
	);

	clk_gen:process
	begin
		wait for time_period/2;
		clk <= not clk;
	end process;

end architecture;
