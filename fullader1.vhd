
library IEEE;
use ieee.std_logic_1164.ALL;

Entity fulladder is
	port(a,b,c : in std_logic;
		sum,cout : out std_logic);
	end entity;

Architecture fulladder_arch of fulladder is
	component hxor is
		generic (gate_delay : time);
		port(a,b : in std_logic;
			o: out std_logic);
		end component;
	component hand is
		generic (gate_delay : time);
		port(a,b : in std_logic;
			o: out std_logic);
		end component;
	component hor is
		generic (gate_delay : time);
		port(a,b : in std_logic;
			o: out std_logic);
		end component;
	for x1,x2 : hxor use entity work.my_gates(xor_arch)
		port map ( a=>a, b=>b, o=>o);
	for u1,u2 : hand use entity work.my_gates(and_arch)
		port map ( a=>a, b=>b, o=>o);
	for o1 : hor use entity work.my_gates(or_arch)
		port map ( a=>a, b=>b, o=>o);
	signal net1,net2,net3 : std_logic;
	begin
		x1 : hxor generic map (gate_delay => 15 ns) port map (a=>a, b=>b, o=>net1);
		x2 : hxor generic map (gate_delay => 15 ns) port map (a=>net1, b=>c, o=>sum);
		u1 : hand generic map (gate_delay => 7 ns) port map (a=>a, b=>b, o=>net2);
		u2 : hand generic map (gate_delay => 7 ns) port map (a=>net1, b=>c, o=>net3);
		o1 : hor generic map (gate_delay => 8 ns) port map (a=> net2 , b => net3, o => cout);
end fulladder_arch;