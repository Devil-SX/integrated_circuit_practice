library ieee;
use ieee.std_logic_1164.all;
-- 4位超前进位加法器电路
-- input:
-- p,g:输入4位被加数
-- cin:输入进位信号
-- output:
-- s:输出结果
-- cout:输出进位信号

entity adder_4 is
	port (
		a:in std_logic_vector(3 downto 0);
		b:in std_logic_vector(3 downto 0);
		cin:in std_logic;
		
		s:out std_logic_vector(3 downto 0);
		cout:out std_logic
	);
end entity;


architecture rtl of adder_4 is
	signal p : std_logic_vector(3 downto 0);
	signal g : std_logic_vector(3 downto 0);

	signal c : std_logic_vector(4 downto 0);
begin

	p <= a xor b;
	g <= a and b;
	
	c(0) <= cin;
	c(1) <= (cin and p(0)) or g(0) ;
	c(2) <= (cin and p(0) and p(1)) or (g(0) and p(1)) or g(1);
	c(3) <= (cin and p(0) and p(1) and P(2)) or (g(0) and p(1) and p(2)) or (g(1) and p(2)) or g(2);
	c(4) <= (cin and p(0) and p(1) and p(2) and p(3)) or (g(0) and p(1) and p(2) and p(3)) or (g(1) and p(2) and p(3)) or (g(2) and p(3)) or g(3);
	
	s(0) <= c(0) xor p(0);
	s(1) <= c(1) xor p(1);
	s(2) <= c(2) xor p(2);
	s(3) <= c(3) xor p(3);
	cout <= c(4);
	
end architecture;
