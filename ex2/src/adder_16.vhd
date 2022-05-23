library ieee;
use ieee.std_logic_1164.all;

-- 16位超前进位加法器
-- input:
-- a,b:被加的16位数
-- cin:进位信息
-- output:
-- s:输出的16位计算结果
-- cout:输出进位信息

entity adder_16 is
	port (
		a:in std_logic_vector(15 downto 0);
		b:in std_logic_vector(15 downto 0);
		cin:in std_logic;

		s:out std_logic_vector(15 downto 0);
		cout:out std_logic
	);
end entity;

architecture rtl of adder_16 is
	signal c:std_logic_vector(3 downto 0);
	component adder_4 port
	(
		a:in std_logic_vector(3 downto 0);
		b:in std_logic_vector(3 downto 0);
		cin:in std_logic;
		s:out std_logic_vector(3 downto 0);
		cout:out std_logic
	);
	end component;
begin

	adder_0to3:  adder_4 port map(a=>a(3 downto 0),		b=>b(3 downto 0),	s=>s(3 downto 0),	cin=>cin,	cout=>c(0));
	adder_4to7:  adder_4 port map(a=>a(7 downto 4),		b=>b(7 downto 4),	s=>s(7 downto 4),	cin=>c(0),	cout=>c(1));
	adder_8to11: adder_4 port map(a=>a(11 downto 8),	b=>b(11 downto 8),	s=>s(11 downto 8),	cin=>c(1),	cout=>c(2));
	adder_12to15:adder_4 port map(a=>a(15 downto 12),	b=>b(15 downto 12),	s=>s(15 downto 12),	cin=>c(2),	cout=>c(3));

	cout <= c(3);
end architecture;