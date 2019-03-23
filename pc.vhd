library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pc is
	port( clk, inc, clr, add: IN std_logic;
		jmp: IN std_logic_vector(3 downto 0);
		addr: OUT std_logic_vector(3 downto 0));
end pc;

architecture beh of PC is
signal reg4b: std_logic_vector(3 downto 0);
begin
	process(clk, clr)
	begin
		if(clr='1')then
			reg4b<="0000";
		elsif(clk='1' and clk'event)then
			if(add='1')then
			reg4b<=reg4b+jmp;
			elsif(inc='1')then
			reg4b<=reg4b+1; -- increment pc by 1
			end if;
		end if;
	end process;
	addr<=reg4b;
end beh;