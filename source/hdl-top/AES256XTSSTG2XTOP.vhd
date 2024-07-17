----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     AES256XTSSTG2XTOP.vhd
-- Title        Top
--
-- Company      Design Gateway Co., Ltd.
-- Project      AES256XTSSTG2XIP
-- PJ No.       
-- Syntax       VHDL
-- Note         
--
-- Version      1.00
-- Author       Pahol S.
-- Date         3/Nov/2023
-- Remark       New Creation
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity AES256XTSSTG2XTOP is
    port
    (
        ExtRstIn : in std_logic;
        ExtClkP  : in std_logic;
        ExtClkN  : in std_logic;

        LED      : out std_logic_vector(2 downto 0)
    );
end entity AES256XTSSTG2XTOP;
architecture rtl of AES256XTSSTG2XTOP is
----------------------------------------------------------------------------------
-- Component declaration
----------------------------------------------------------------------------------
    component AES256XTSSTG2XDemo is
    port
    (
        ExtRstB : in std_logic; -- extenal Reset, Active Low
        Clk     : in std_logic;

        LED     : out std_logic_vector(1 downto 0)
    );
    end component AES256XTSSTG2XDemo;

    component clk_wiz_0 is
    port
    (
        Reset     : in std_logic;
        Clk_in1_p : in std_logic;
        Clk_in1_n : in std_logic;

        Clk_out1  : out std_logic;
        Locked    : out std_logic
    );
    end component clk_wiz_0;
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
    signal ExtRstB : std_logic;
    signal IPClk   : std_logic;
begin
----------------------------------------------------------------------------------
-- Component mapping 
----------------------------------------------------------------------------------
    LED(2) <= ExtRstB;

    c_clk_wiz_0 : clk_wiz_0
    port map
    (
        Reset     => ExtRstIn,
        Clk_in1_p => ExtClkP,
        Clk_in1_n => ExtClkN,

        Clk_out1  => IPClk,
        Locked    => ExtRstB
    );

    c_AES256XTSSTG2XDemo : AES256XTSSTG2XDemo
    port map
    (
        ExtRstB => ExtRstB,
    
        Clk     => IPClk,
        LED     => LED(1 downto 0)
    );

end architecture rtl;
