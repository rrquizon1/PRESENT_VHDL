----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/20/2023 06:02:01 AM
-- Design Name: 
-- Module Name: pbox - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pbox is
--  Port ( );
port( sout: in std_logic_vector(63 downto 0);
      pout: out std_logic_vector (63 downto 0));
      
      

end pbox;

architecture Behavioral of pbox is

begin
process(sout)
begin
pout(0)<=	sout(0);
pout(16)<=	sout(1);
pout(32)<=	sout(2);
pout(48)<=	sout(3);
			
pout(1)<=	sout(4);
pout(17)<=	sout(5);
pout(33)<=	sout(6);
pout(49)<=	sout(7);
			
pout(2)<=	sout(8);
pout(18)<=	sout(9);
pout(34)<= 	sout(10);
pout(50)<=  sout(11);
			
pout(3)<=  sout(12);
pout(19)<=	sout(13);
pout(35)<=	sout(14);
pout(51)<=	sout(15);
			
pout(4)<=	sout(16);
pout(20)<=	sout(17);
pout(36)<=	sout(18);
pout(52)<=	sout(19);
			
pout(5)<=	sout(20);
pout(21)<=	sout(21);
pout(37)<=	sout(22);
pout(53)<=	sout(23);
			
pout(6)<=	sout(24);
pout(22)<=	sout(25);
pout(38)<=	sout(26);
pout(54)<=	sout(27);
			
pout(7)<=	sout(28);
pout(23)<=	sout(29);
pout(39)<=	sout(30);
pout(55)<=	sout(31);
			
pout(8)<=	sout(32);
pout(24)<=	sout(33);
pout(40)<=	sout(34);
pout(56)<=	sout(35);
			
pout(9)<=	sout(36);
pout(25)<=	sout(37);
pout(41)<=	sout(38);
pout(57)<=	sout(39);
			
pout(10)<=	sout(40);
pout(26)<=	sout(41);
pout(42)<=	sout(42);
pout(58)<=	sout(43);
			
pout(11)<=	sout(44);
pout(27)<=	sout(45);
pout(43)<=	sout(46);
pout(59)<=	sout(47);
			
pout(12)<=	sout(48);
pout(28)<=	sout(49);
pout(44)<=	sout(50);
pout(60)<=	sout(51);
			
pout(13)<=	sout(52);
pout(29)<=	sout(53);
pout(45)<=	sout(54);
pout(61)<=	sout(55);
			
pout(14)<=	sout(56);
pout(30)<=	sout(57);
pout(46)<=	sout(58);
pout(62)<=	sout(59);
			
pout(15)<=	sout(60);
pout(31)<=	sout(61);
pout(47)<=	sout(62);
pout(63)<=	sout(63);
end process;

end Behavioral;
