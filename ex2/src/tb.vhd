library ieee;
use ieee.std_logic_1164.all;

entity tb is
end entity;

architecture rtl of tb is
	
	component  adder_16 
	port (
		a:in std_logic_vector(15 downto 0);
		b:in std_logic_vector(15 downto 0);
		cin:in std_logic;

		s:out std_logic_vector(15 downto 0);
		cout:out std_logic
	);
	end component;

	constant signal_time : time := 10ns;
	signal a:std_logic_vector(15 downto 0);
	signal b:std_logic_vector(15 downto 0);
	signal s:std_logic_vector(15 downto 0);
	signal cin:std_logic;
	signal cout:std_logic;

begin

	instant: adder_16 port map(a=>a,b=>b,cin=>cin,s=>s,cout=>cout);

	process begin
		-- 测试两组cout理论为0
		a <= "0010000001000000";--2040
		b <= "0100001001110000";--4270
		cin <= '0';

		wait for signal_time;

		a <= "0010000001000000";--2040
		b <= "0100001001110000";--4270
		cin <= '1';

		wait for signal_time;

		-- 测试两组cout理论为1
		a <= "0011111100000000";--3F00
		b <= "1111111100000000";--FF00
		cin <= '0';

		wait for signal_time;

		a <= "0011111100000000";--3F00
		b <= "1111111100000000";--FF00
		cin <= '1';

		wait for signal_time;
	end process;

end architecture;