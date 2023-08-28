----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/20/2023 05:45:07 AM
-- Design Name: 
-- Module Name: mini_sub - Behavioral
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

entity mini_sub is
port (din: in std_logic_vector(3 downto 0);
      dout: out std_logic_vector(3 downto 0));
--  Port ( );
end mini_sub;

architecture Behavioral of mini_sub is

begin
process(din)
begin
case(din) is 
    when "0000" => dout<="1100";--C
    when "0001" => dout<="0101";--5
    when "0010" => dout<="0110";--6
    when "0011" => dout<="1011";--B
    when "0100" => dout<="1001";--9
    when "0101" => dout<="0000";--0
    when "0110" => dout<="1010";--A
    when "0111" => dout<="1101";--E
    when "1000" => dout<="0011";--3
    when "1001" => dout<="1110";--E
    when "1010" => dout<="1111";--F
    when "1011" => dout<="1000";--8
    when "1100" => dout<="0100";--4
    when "1101" => dout<="0111";--7
    when "1110" => dout<="0001";--1
    when "1111" => dout<="0010";--2
    when others => dout<="0000";   --     
end case;



end process;

end Behavioral;
