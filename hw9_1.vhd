library gate;
library IEEE;
use IEEE.std_logic_1164.ALL;

entity gates_struc is
	port(a,b : in std_logic;
		o: out std_logic);
end entity;

Architecture gates_struc_arch of gates_struc is
		component HXOR is
		port (a,b: in std_logic;
			o : out std_logic);
		end component;
	for hx1 : HXOR use configuration work.conf_gates;
	end for;
	begin 
		hx1 : HXOR port map(a,b,o);
	
end gates_struc_arch;

--use ieee.std_logic_1164.ALL;

--configuration conf_gates of gates_struc is 
--	for gates_struc_arch
--		use gate.ALL;
--		for hx1 : HXOR use entity gate.hxor_e(hxor_arch);
--		end for;
--	end for;
--end conf_gates;
	