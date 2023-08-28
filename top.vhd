----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/20/2023 06:14:23 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
--  Port ( );
port(clk:in std_logic;
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
end top;

architecture Behavioral of top is
signal sout,pout,keyout,sin,din_key: std_logic_vector (63 downto 0):=X"0000000000000000";
signal din_en_buff: std_logic;

constant initialize: integer:=0;
constant get_data: integer:=1;
constant roundx: integer:=2;
constant sbox_state: integer:=3;
constant pbox_state: integer:=4;
constant cont: integer:=5;
constant out1: integer:=6;
constant out2: integer:=7;


signal count: std_logic_vector(5 downto 0);
signal rkey: std_logic_vector (79 downto 0):=X"00000000000000000000"; --80 bit key register
signal rkeyx: std_logic_vector(63 downto 0):=X"0000000000000000"; --roundkey
signal keysubin,keysubout,out1_count,out2_count: std_logic_vector(3 downto 0);-- keysubout keyscheduleloop
signal rkeyop1: std_logic_vector(4 downto 0);--xor count 19;15
signal rkeyop2: std_logic_vector (14 downto 0);-- 14:0
signal dout_buff: std_logic_vector (63 downto 0);
signal state_buffer:std_logic_vector (3 downto 0);
signal din_gate_buffer: std_logic_vector (31 downto 0);
signal gclk_buffer: std_logic;

component mini_sub port(din: in std_logic_vector(3 downto 0);
      dout: out std_logic_vector(3 downto 0));
--  Port ( );
end component;

component pbox 
port( sout: in std_logic_vector(63 downto 0);
      pout: out std_logic_vector (63 downto 0));

end component;



component sbox
port(din: in std_logic_vector (63 downto 0);
     dout: out std_logic_vector(63 downto 0));
end component;


begin

u0: sbox port map(din=>sin,dout=>sout);
u1: pbox port map(sout=>sout,pout=>pout);
u3: mini_sub port map( din=>keysubin, dout=>keysubout);


--state<=std_logic_vector(to_unsigned(initialize,4));
state_machine:process(gclk_buffer)
begin 
if (rst='0') then
    state_buffer<=std_logic_vector(to_unsigned(initialize,4));
    dout<=X"00000000";

elsif(rising_edge(gclk_buffer))then
    case(state_buffer)is
        when std_logic_vector(to_unsigned(initialize,4)) =>
            state_buffer<=std_logic_vector(to_unsigned(get_data,4));
            rkey<=X"00000000000000000000";
            count<="000001";
            out1_count<="0000";
            out2_count<="0000";
            done1<='0';
            done2<='0';
            din_en_buff<='1';
            
        when std_logic_vector(to_unsigned(get_data,4))=>
            din_key<=X"00000000" & din_gate_buffer;      
            rkeyx<=rkey(79 downto 16);
            rkey<= rkey(18 downto 0) & rkey (79 downto 19);
            state_buffer<=std_logic_vector(to_unsigned(roundx,4));
            din_en_buff<='0';
            
       when std_logic_vector(to_unsigned(roundx,4))=>
            keysubin <=rkey(79 downto 76);
            if (count=X"20") then --32 loops
                dout_buff<=din_key xor rkeyx;
                state_buffer<=std_logic_vector(to_unsigned(out1,4));
            else 
                keyout<=rkeyx xor din_key;
                state_buffer<=std_logic_vector(to_unsigned(sbox_state,4));
            end if;
      
      when std_logic_vector(to_unsigned(sbox_state,4))=>
            rkey<=keysubout & rkey (75 downto 0);
            sin<=keyout;
            state_buffer<=std_logic_vector(to_unsigned(pbox_state,4));
            rkeyop1<= rkey(19 downto 15) xor count(4 downto 0);
            rkeyop2<= rkey (14 downto 0);
      
      when std_logic_vector(to_unsigned(pbox_state,4))=>
            rkey<= rkey(79 downto 20) & rkeyop1 & rkeyop2;
            state_buffer<= std_logic_vector(to_unsigned(cont,4));
            count<=count+1;
            din_key<=pout;
     
     when  std_logic_vector(to_unsigned(cont,4))=>
            rkeyx<=rkey(79 downto 16);
            rkey<=rkey(18 downto 0) & rkey (79 downto 19);
            state_buffer<= std_logic_vector(to_unsigned(roundx,4));
      
     when  std_logic_vector(to_unsigned(out1,4))=>
            if (out1_count<1) then
               state_buffer<=std_logic_vector(to_unsigned(out1,4));
               dout<=dout_buff(63 downto 32);
               out1_count<=out1_count+1;
               
            else 
                done1<='0';
                state_buffer<=std_logic_vector(to_unsigned(out2,4));
            end if;
     
     when  std_logic_vector(to_unsigned(out2,4)) =>
             if out2_count<1 then
                    state_buffer<=std_logic_vector(to_unsigned(out2,4));
                    dout<=dout_buff(31 downto 0); 
                    out2_count<=out2_count+1;
                    done2<='1';
                    
             else 
                    done2<='0';
                    state_buffer<=std_logic_vector(to_unsigned(initialize,4));
                    
             end if;
      

      
      
        when others=>
            dout<=X"00000000";
      
      
    
    end case;
    

end if;
end process;














state<=state_buffer;
gclk_buffer<=rst and clk;
din_en<=din_en_buff;
din_gate_buffer(0)<=din_en_buff and din(0);
din_gate_buffer(1)<=din_en_buff and din(1);
din_gate_buffer(2)<=din_en_buff and din(2);
din_gate_buffer(3)<=din_en_buff and din(3);
din_gate_buffer(4)<=din_en_buff and din(4);
din_gate_buffer(5)<=din_en_buff and din(5);
din_gate_buffer(6)<=din_en_buff and din(6);
din_gate_buffer(7)<=din_en_buff and din(7);
din_gate_buffer(8)<=din_en_buff and din(8);
din_gate_buffer(9)<=din_en_buff and din(9);
din_gate_buffer(10)<=din_en_buff and din(10);
din_gate_buffer(11)<=din_en_buff and din(11);
din_gate_buffer(12)<=din_en_buff and din(12);
din_gate_buffer(13)<=din_en_buff and din(13);
din_gate_buffer(14)<=din_en_buff and din(14);
din_gate_buffer(15)<=din_en_buff and din(15);
din_gate_buffer(16)<=din_en_buff and din(15);
din_gate_buffer(17)<=din_en_buff and din(16);
din_gate_buffer(18)<=din_en_buff and din(17);
din_gate_buffer(19)<=din_en_buff and din(18);
din_gate_buffer(20)<=din_en_buff and din(19);
din_gate_buffer(21)<=din_en_buff and din(20);
din_gate_buffer(22)<=din_en_buff and din(21);
din_gate_buffer(23)<=din_en_buff and din(22);
din_gate_buffer(24)<=din_en_buff and din(23);
din_gate_buffer(25)<=din_en_buff and din(24);
din_gate_buffer(26)<=din_en_buff and din(25);
din_gate_buffer(26)<=din_en_buff and din(26);
din_gate_buffer(27)<=din_en_buff and din(27);
din_gate_buffer(28)<=din_en_buff and din(28);
din_gate_buffer(29)<=din_en_buff and din(29);
din_gate_buffer(30)<=din_en_buff and din(30);
din_gate_buffer(31)<=din_en_buff and din(31);

state<=state_buffer;
gclk<=gclk_buffer;
din_gate<=din_gate_buffer;
end Behavioral;
