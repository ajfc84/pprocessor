library ieee;
use ieee.std_logic_1164.all;

entity operands is
	port(s: IN std_logic;
		a1, a2: IN std_logic_vector(3 downto 0);
		oprnd: OUT std_logic_vector(3 downto 0));
end operands;

architecture beh of operands is
begin
	process(s,a1,a2)
	begin
		if(s='0')then
			oprnd<=a1;
		elsif(s='1')then
			oprnd<=a2;
		end if;
	end process;
end beh;