library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity divider_10 is
port(
	clk : in std_logic;
	clk_div : out std_logic
);
end entity;


architecture trl of divider_10 is
	signal out_put: std_logic := '0';
	signal count : unsigned(2 downto 0) := (others => '0');
begin

	process(clk) is
	begin
		if(clk 'event and clk = '1') then
			if(std_logic_vector(count) = "100") then
				count <= "000";
				out_put <= not out_put;
			else
				count <= count + '1';
			end if;
		end if;

		clk_div <= out_put;
	end process;

end architecture;
