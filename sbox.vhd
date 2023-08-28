----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/19/2023 08:21:51 AM
-- Design Name: 
-- Module Name: sbox - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sbox is
--  Port ( );

port(din: in std_logic_vector (63 downto 0);
     dout: out std_logic_vector(63 downto 0));
end sbox;

architecture Behavioral of sbox is
signal  keyout1_l1,keyout1_l2,keyout1_l3,keyout1_l4,keyout1_l5,keyout1_l6,keyout1_l7,keyout1_l8,keyout1_r1,keyout1_r2,keyout1_r3,keyout1_r4,keyout1_r5,keyout1_r6,keyout1_r7,keyout1_r8: std_logic_vector (3 downto 0);
signal sout1_l1,sout1_r1: std_logic_vector (3 downto 0);
signal sout1_l2,sout1_r2: std_logic_vector (3 downto 0);
signal sout1_l3,sout1_r3: std_logic_vector (3 downto 0);
signal sout1_l4,sout1_r4: std_logic_vector (3 downto 0);
signal sout1_l5,sout1_r5: std_logic_vector (3 downto 0);
signal sout1_l6,sout1_r6: std_logic_vector (3 downto 0);
signal sout1_l7,sout1_r7: std_logic_vector (3 downto 0);
signal sout1_l8,sout1_r8: std_logic_vector (3 downto 0);



begin

keyout1_l1<=din(63 downto 60);
keyout1_l2<=din(59 downto 56);
keyout1_l3<=din(55 downto 52);
keyout1_l4<=din(51 downto 48);
keyout1_l5<=din(47 downto 44);
keyout1_l6<=din(43 downto 40);
keyout1_l7<=din(39 downto 36);
keyout1_l8<=din(35 downto 32);
keyout1_r1<=din(31 downto 28);
keyout1_r2<=din(27 downto 24);
keyout1_r3<=din(23 downto 20);
keyout1_r4<=din(19 downto 16);
keyout1_r5<=din(15 downto 12);
keyout1_r6<=din(11 downto 8);
keyout1_r7<=din(7 downto 4);
keyout1_r8<=din(3 downto 0);



process(keyout1_l1)
begin

case(keyout1_l1) is 
    when "0000" => sout1_l1<="1100";--C
    when "0001" => sout1_l1<="0101";--5
    when "0010" => sout1_l1<="0110";--6
    when "0011" => sout1_l1<="1011";--B
    when "0100" => sout1_l1<="1001";--9
    when "0101" => sout1_l1<="0000";--0
    when "0110" => sout1_l1<="1010";--A
    when "0111" => sout1_l1<="1101";--E
    when "1000" => sout1_l1<="0011";--3
    when "1001" => sout1_l1<="1110";--E
    when "1010" => sout1_l1<="1111";--F
    when "1011" => sout1_l1<="1000";--8
    when "1100" => sout1_l1<="0100";--4
    when "1101" => sout1_l1<="0111";--7
    when "1110" => sout1_l1<="0001";--1
    when "1111" => sout1_l1<="0010";--2
    when others => sout1_l1<="0000";   --     
end case;

end process;

process( keyout1_l2)
begin
case(keyout1_l2) is 
    when "0000" => sout1_l2<="1100";--C
    when "0001" => sout1_l2<="0101";--5
    when "0010" => sout1_l2<="0110";--6
    when "0011" => sout1_l2<="1011";--B
    when "0100" => sout1_l2<="1001";--9
    when "0101" => sout1_l2<="0000";--0
    when "0110" => sout1_l2<="1010";--A
    when "0111" => sout1_l2<="1101";--E
    when "1000" => sout1_l2<="0011";--3
    when "1001" => sout1_l2<="1110";--E
    when "1010" => sout1_l2<="1111";--F
    when "1011" => sout1_l2<="1000";--8
    when "1100" => sout1_l2<="0100";--4
    when "1101" => sout1_l2<="0111";--7
    when "1110" => sout1_l2<="0001";--1
    when "1111" => sout1_l2<="0010";--2
    when others => sout1_l2<="0000";   --     
end case;
end process;

process(keyout1_l3)
begin
case(keyout1_l3) is 
    when "0000" => sout1_l3<="1100";--C
    when "0001" => sout1_l3<="0101";--5
    when "0010" => sout1_l3<="0110";--6
    when "0011" => sout1_l3<="1011";--B
    when "0100" => sout1_l3<="1001";--9
    when "0101" => sout1_l3<="0000";--0
    when "0110" => sout1_l3<="1010";--A
    when "0111" => sout1_l3<="1101";--E
    when "1000" => sout1_l3<="0011";--3
    when "1001" => sout1_l3<="1110";--E
    when "1010" => sout1_l3<="1111";--F
    when "1011" => sout1_l3<="1000";--8
    when "1100" => sout1_l3<="0100";--4
    when "1101" => sout1_l3<="0111";--7
    when "1110" => sout1_l3<="0001";--1
    when "1111" => sout1_l3<="0010";--2
    when others => sout1_l3<="0000";   --     
end case;

end process;

process(keyout1_l4)
begin
case(keyout1_l4) is 
    when "0000" => sout1_l4<="1100";--C
    when "0001" => sout1_l4<="0101";--5
    when "0010" => sout1_l4<="0110";--6
    when "0011" => sout1_l4<="1011";--B
    when "0100" => sout1_l4<="1001";--9
    when "0101" => sout1_l4<="0000";--0
    when "0110" => sout1_l4<="1010";--A
    when "0111" => sout1_l4<="1101";--E
    when "1000" => sout1_l4<="0011";--3
    when "1001" => sout1_l4<="1110";--E
    when "1010" => sout1_l4<="1111";--F
    when "1011" => sout1_l4<="1000";--8
    when "1100" => sout1_l4<="0100";--4
    when "1101" => sout1_l4<="0111";--7
    when "1110" => sout1_l4<="0001";--1
    when "1111" => sout1_l4<="0010";--2
    when others => sout1_l4<="0000";   --     
end case;
end process;

process(keyout1_l5)
begin
case(keyout1_l5) is 
    when "0000" => sout1_l5<="1100";--C
    when "0001" => sout1_l5<="0101";--5
    when "0010" => sout1_l5<="0110";--6
    when "0011" => sout1_l5<="1011";--B
    when "0100" => sout1_l5<="1001";--9
    when "0101" => sout1_l5<="0000";--0
    when "0110" => sout1_l5<="1010";--A
    when "0111" => sout1_l5<="1101";--E
    when "1000" => sout1_l5<="0011";--3
    when "1001" => sout1_l5<="1110";--E
    when "1010" => sout1_l5<="1111";--F
    when "1011" => sout1_l5<="1000";--8
    when "1100" => sout1_l5<="0100";--4
    when "1101" => sout1_l5<="0111";--7
    when "1110" => sout1_l5<="0001";--1
    when "1111" => sout1_l5<="0010";--2
    when others => sout1_l5<="0000";   --     
end case;
end process;

process(keyout1_l6)
begin
case(keyout1_l6) is 
    when "0000" => sout1_l6<="1100";--C
    when "0001" => sout1_l6<="0101";--5
    when "0010" => sout1_l6<="0110";--6
    when "0011" => sout1_l6<="1011";--B
    when "0100" => sout1_l6<="1001";--9
    when "0101" => sout1_l6<="0000";--0
    when "0110" => sout1_l6<="1010";--A
    when "0111" => sout1_l6<="1101";--E
    when "1000" => sout1_l6<="0011";--3
    when "1001" => sout1_l6<="1110";--E
    when "1010" => sout1_l6<="1111";--F
    when "1011" => sout1_l6<="1000";--8
    when "1100" => sout1_l6<="0100";--4
    when "1101" => sout1_l6<="0111";--7
    when "1110" => sout1_l6<="0001";--1
    when "1111" => sout1_l6<="0010";--2
    when others => sout1_l6<="0000";   --     
end case;

end process;

process(keyout1_l7)
begin
case(keyout1_l7) is 
    when "0000" => sout1_l7<="1100";--C
    when "0001" => sout1_l7<="0101";--5
    when "0010" => sout1_l7<="0110";--6
    when "0011" => sout1_l7<="1011";--B
    when "0100" => sout1_l7<="1001";--9
    when "0101" => sout1_l7<="0000";--0
    when "0110" => sout1_l7<="1010";--A
    when "0111" => sout1_l7<="1101";--E
    when "1000" => sout1_l7<="0011";--3
    when "1001" => sout1_l7<="1110";--E
    when "1010" => sout1_l7<="1111";--F
    when "1011" => sout1_l7<="1000";--8
    when "1100" => sout1_l7<="0100";--4
    when "1101" => sout1_l7<="0111";--7
    when "1110" => sout1_l7<="0001";--1
    when "1111" => sout1_l7<="0010";--2
    when others => sout1_l7<="0000";   --     
end case;
end process;

process(keyout1_l8)
begin
case(keyout1_l8) is 
    when "0000" => sout1_l8<="1100";--C
    when "0001" => sout1_l8<="0101";--5
    when "0010" => sout1_l8<="0110";--6
    when "0011" => sout1_l8<="1011";--B
    when "0100" => sout1_l8<="1001";--9
    when "0101" => sout1_l8<="0000";--0
    when "0110" => sout1_l8<="1010";--A
    when "0111" => sout1_l8<="1101";--E
    when "1000" => sout1_l8<="0011";--3
    when "1001" => sout1_l8<="1110";--E
    when "1010" => sout1_l8<="1111";--F
    when "1011" => sout1_l8<="1000";--8
    when "1100" => sout1_l8<="0100";--4
    when "1101" => sout1_l8<="0111";--7
    when "1110" => sout1_l8<="0001";--1
    when "1111" => sout1_l8<="0010";--2
    when others => sout1_l8<="0000";   --     
end case;

end process;

process(keyout1_r1)
begin

case(keyout1_r1) is 
    when "0000" => sout1_r1<="1100";--C
    when "0001" => sout1_r1<="0101";--5
    when "0010" => sout1_r1<="0110";--6
    when "0011" => sout1_r1<="1011";--B
    when "0100" => sout1_r1<="1001";--9
    when "0101" => sout1_r1<="0000";--0
    when "0110" => sout1_r1<="1010";--A
    when "0111" => sout1_r1<="1101";--E
    when "1000" => sout1_r1<="0011";--3
    when "1001" => sout1_r1<="1110";--E
    when "1010" => sout1_r1<="1111";--F
    when "1011" => sout1_r1<="1000";--8
    when "1100" => sout1_r1<="0100";--4
    when "1101" => sout1_r1<="0111";--7
    when "1110" => sout1_r1<="0001";--1
    when "1111" => sout1_r1<="0010";--2
    when others => sout1_r1<="0000";   --     
end case;

end process;

process( keyout1_r2)
begin
case(keyout1_r2) is 
    when "0000" => sout1_r2<="1100";--C
    when "0001" => sout1_r2<="0101";--5
    when "0010" => sout1_r2<="0110";--6
    when "0011" => sout1_r2<="1011";--B
    when "0100" => sout1_r2<="1001";--9
    when "0101" => sout1_r2<="0000";--0
    when "0110" => sout1_r2<="1010";--A
    when "0111" => sout1_r2<="1101";--E
    when "1000" => sout1_r2<="0011";--3
    when "1001" => sout1_r2<="1110";--E
    when "1010" => sout1_r2<="1111";--F
    when "1011" => sout1_r2<="1000";--8
    when "1100" => sout1_r2<="0100";--4
    when "1101" => sout1_r2<="0111";--7
    when "1110" => sout1_r2<="0001";--1
    when "1111" => sout1_r2<="0010";--2
    when others => sout1_r2<="0000";   --     
end case;
end process;

process(keyout1_r3)
begin
case(keyout1_r3) is 
    when "0000" => sout1_r3<="1100";--C
    when "0001" => sout1_r3<="0101";--5
    when "0010" => sout1_r3<="0110";--6
    when "0011" => sout1_r3<="1011";--B
    when "0100" => sout1_r3<="1001";--9
    when "0101" => sout1_r3<="0000";--0
    when "0110" => sout1_r3<="1010";--A
    when "0111" => sout1_r3<="1101";--E
    when "1000" => sout1_r3<="0011";--3
    when "1001" => sout1_r3<="1110";--E
    when "1010" => sout1_r3<="1111";--F
    when "1011" => sout1_r3<="1000";--8
    when "1100" => sout1_r3<="0100";--4
    when "1101" => sout1_r3<="0111";--7
    when "1110" => sout1_r3<="0001";--1
    when "1111" => sout1_r3<="0010";--2
    when others => sout1_r3<="0000";   --     
end case;

end process;

process(keyout1_r4)
begin
case(keyout1_r4) is 
    when "0000" => sout1_r4<="1100";--C
    when "0001" => sout1_r4<="0101";--5
    when "0010" => sout1_r4<="0110";--6
    when "0011" => sout1_r4<="1011";--B
    when "0100" => sout1_r4<="1001";--9
    when "0101" => sout1_r4<="0000";--0
    when "0110" => sout1_r4<="1010";--A
    when "0111" => sout1_r4<="1101";--E
    when "1000" => sout1_r4<="0011";--3
    when "1001" => sout1_r4<="1110";--E
    when "1010" => sout1_r4<="1111";--F
    when "1011" => sout1_r4<="1000";--8
    when "1100" => sout1_r4<="0100";--4
    when "1101" => sout1_r4<="0111";--7
    when "1110" => sout1_r4<="0001";--1
    when "1111" => sout1_r4<="0010";--2
    when others => sout1_r4<="0000";   --     
end case;
end process;

process(keyout1_r5)
begin
case(keyout1_r5) is 
    when "0000" => sout1_r5<="1100";--C
    when "0001" => sout1_r5<="0101";--5
    when "0010" => sout1_r5<="0110";--6
    when "0011" => sout1_r5<="1011";--B
    when "0100" => sout1_r5<="1001";--9
    when "0101" => sout1_r5<="0000";--0
    when "0110" => sout1_r5<="1010";--A
    when "0111" => sout1_r5<="1101";--E
    when "1000" => sout1_r5<="0011";--3
    when "1001" => sout1_r5<="1110";--E
    when "1010" => sout1_r5<="1111";--F
    when "1011" => sout1_r5<="1000";--8
    when "1100" => sout1_r5<="0100";--4
    when "1101" => sout1_r5<="0111";--7
    when "1110" => sout1_r5<="0001";--1
    when "1111" => sout1_r5<="0010";--2
    when others => sout1_r5<="0000";   --     
end case;
end process;

process(keyout1_r6)
begin
case(keyout1_r6) is 
    when "0000" => sout1_r6<="1100";--C
    when "0001" => sout1_r6<="0101";--5
    when "0010" => sout1_r6<="0110";--6
    when "0011" => sout1_r6<="1011";--B
    when "0100" => sout1_r6<="1001";--9
    when "0101" => sout1_r6<="0000";--0
    when "0110" => sout1_r6<="1010";--A
    when "0111" => sout1_r6<="1101";--E
    when "1000" => sout1_r6<="0011";--3
    when "1001" => sout1_r6<="1110";--E
    when "1010" => sout1_r6<="1111";--F
    when "1011" => sout1_r6<="1000";--8
    when "1100" => sout1_r6<="0100";--4
    when "1101" => sout1_r6<="0111";--7
    when "1110" => sout1_r6<="0001";--1
    when "1111" => sout1_r6<="0010";--2
    when others => sout1_r6<="0000";   --     
end case;

end process;

process(keyout1_r7)
begin
case(keyout1_r7) is 
    when "0000" => sout1_r7<="1100";--C
    when "0001" => sout1_r7<="0101";--5
    when "0010" => sout1_r7<="0110";--6
    when "0011" => sout1_r7<="1011";--B
    when "0100" => sout1_r7<="1001";--9
    when "0101" => sout1_r7<="0000";--0
    when "0110" => sout1_r7<="1010";--A
    when "0111" => sout1_r7<="1101";--E
    when "1000" => sout1_r7<="0011";--3
    when "1001" => sout1_r7<="1110";--E
    when "1010" => sout1_r7<="1111";--F
    when "1011" => sout1_r7<="1000";--8
    when "1100" => sout1_r7<="0100";--4
    when "1101" => sout1_r7<="0111";--7
    when "1110" => sout1_r7<="0001";--1
    when "1111" => sout1_r7<="0010";--2
    when others => sout1_r7<="0000";   --     
end case;
end process;

process(keyout1_r8)
begin
case(keyout1_r8) is 
    when "0000" => sout1_r8<="1100";--C
    when "0001" => sout1_r8<="0101";--5
    when "0010" => sout1_r8<="0110";--6
    when "0011" => sout1_r8<="1011";--B
    when "0100" => sout1_r8<="1001";--9
    when "0101" => sout1_r8<="0000";--0
    when "0110" => sout1_r8<="1010";--A
    when "0111" => sout1_r8<="1101";--E
    when "1000" => sout1_r8<="0011";--3
    when "1001" => sout1_r8<="1110";--E
    when "1010" => sout1_r8<="1111";--F
    when "1011" => sout1_r8<="1000";--8
    when "1100" => sout1_r8<="0100";--4
    when "1101" => sout1_r8<="0111";--7
    when "1110" => sout1_r8<="0001";--1
    when "1111" => sout1_r8<="0010";--2
    when others => sout1_r8<="0000";   --     
end case;

end process;



dout<=sout1_l1 & sout1_l2 & sout1_l3 & sout1_l4 & sout1_l5 & sout1_l6 & sout1_l7 & sout1_l8 & sout1_r1 & sout1_r2 & sout1_r3 & sout1_r4 & sout1_r5 & sout1_r6 & sout1_r7 & sout1_r8;








end Behavioral;
