----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/21/2023 07:39:41 PM
-- Design Name: 
-- Module Name: tb - Behavioral
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
use std.env.finish;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is


signal clk,rst,gclk,done1,done2,din_en: std_logic:='0';

signal din: std_logic_vector (31 downto 0):=X"00000000";

signal state:std_logic_vector (3 downto 0);
signal dout: std_logic_vector (31 downto 0);
signal din_gate: std_logic_vector (31 downto 0);

component top port(clk:in std_logic;
     rst:in std_logic;
     din: in std_logic_vector(31 downto 0);
     gclk: out std_logic;
     din_en: out std_logic;
     din_gate: out std_logic_vector(31 downto 0);
     done1: out std_logic; 
     done2: out std_logic; 
     state: out std_logic_vector(3 downto 0);
     dout: out std_logic_vector(31 downto 0) 
     );
     
end component;




begin
u0: top port map(clk=>clk,rst=>rst,din=>din,gclk=>gclk,din_en=>din_en,din_gate=>din_gate,done1=>done1,done2=>done2,state=>state,dout=>dout); 


clk_gen:process(clk)
    begin
    clk<= not clk after 100 ns;
    
    
    end process;

    
    
tb:process
begin
rst<='0';

wait for 100ns;

rst<='1';


wait for 26 us;

rst<='0';

finish;


end process;






end Behavioral;
