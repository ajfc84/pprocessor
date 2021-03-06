library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
	port( op: IN std_logic_vector(3 downto 0);
		a, b: IN std_logic_vector(7 downto 0);
		r: OUT std_logic_vector(7 downto 0));
end alu;

architecture beh of alu is
begin
	process(op,a,b)
	begin
		if(op="0000")then
			r<=a;
		elsif(op="0001")then
			r<=a+b;
		elsif(op="0010")then
			r<=a-b;
		elsif(op="0011")then
			r<=a and b;
		elsif(op="0100")then
			r<=a or b;
		else
			r<="ZZZZZZZZ";
		end if;
	end process;
end beh;