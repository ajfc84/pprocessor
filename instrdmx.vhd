library ieee;
use ieee.std_logic_1164.all;

entity instrdmx is
	port( s: IN std_logic;
		ninstr, cinstr: IN std_logic_vector(15 downto 0);
		code, oprd0, oprd1, oprd2: OUT std_logic_vector(3 downto 0));
end instrdmx;

architecture beh of instrdmx is
begin
	process(s,ninstr,cinstr)
	begin
		if(s='1')then
			code<=ninstr(15)&ninstr(14)&ninstr(13)&ninstr(12);
			oprd0<=ninstr(11)&ninstr(10)&ninstr(9)&ninstr(8);
			oprd1<=ninstr(7)&ninstr(6)&ninstr(5)&ninstr(4);
			oprd2<=ninstr(3)&ninstr(2)&ninstr(1)&ninstr(0);
		else
			code<=cinstr(15)&cinstr(14)&cinstr(13)&cinstr(12);
			oprd0<=cinstr(11)&cinstr(10)&cinstr(9)&cinstr(8);
			oprd1<=cinstr(7)&cinstr(6)&cinstr(5)&cinstr(4);
			oprd2<=cinstr(3)&cinstr(2)&cinstr(1)&cinstr(0);
		end if;
	end process;
end beh;