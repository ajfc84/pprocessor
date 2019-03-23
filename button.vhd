library ieee;
use ieee.std_logic_1164.all;

entity button is
	port( clk, i: IN std_logic;
		o: OUT std_logic);
end button;

architecture beh of button is
signal s, n: std_logic;
begin
	process(s,i)
	begin
		if(i='0' and s='0')then
			o<='0';
			n<='0';
		elsif(i='1' and s='0')then
			o<='1';
			n<='1';
		elsif(i='1' and s='1')then
			o<='0';
			n<='1';
		elsif(i='0' and s='1')then
			o<='0';
			n<='0';
		end if;
	end process;
	process(clk)
	begin
		if(clk='1' and clk'event)then
			s<=n;
		end if;
	end process;
end beh;