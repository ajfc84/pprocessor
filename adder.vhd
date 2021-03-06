library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
	port( s: IN std_logic;
		a, b: IN std_logic_vector(3 downto 0);
		r: OUT std_logic_vector(3 downto 0));
end adder;

architecture beh of adder is
begin
	process(a,b,s)
	begin
		if(s='0')then
			r<=a;
		elsif(s='1')then
			r<=a+b;
		end if;
	end process;
end beh;