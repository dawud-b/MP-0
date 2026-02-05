--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_9bd8_wrapper.bd
--Design : bd_9bd8_wrapper
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_9bd8_wrapper is
  port (
    SLOT_0_VIDEO_TIMING_active_video : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_hblank : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_hsync : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_vblank : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_vsync : in STD_LOGIC;
    SLOT_1_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_1_AXIS_tkeep : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_1_AXIS_tlast : in STD_LOGIC;
    SLOT_1_AXIS_tready : in STD_LOGIC;
    SLOT_1_AXIS_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_1_AXIS_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 35 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    resetn : in STD_LOGIC
  );
end bd_9bd8_wrapper;

architecture STRUCTURE of bd_9bd8_wrapper is
  component bd_9bd8 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 35 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    resetn : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_active_video : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_hblank : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_hsync : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_vblank : in STD_LOGIC;
    SLOT_0_VIDEO_TIMING_vsync : in STD_LOGIC;
    SLOT_1_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_1_AXIS_tkeep : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_1_AXIS_tlast : in STD_LOGIC;
    SLOT_1_AXIS_tready : in STD_LOGIC;
    SLOT_1_AXIS_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_1_AXIS_tvalid : in STD_LOGIC
  );
  end component bd_9bd8;
begin
bd_9bd8_i: component bd_9bd8
     port map (
      SLOT_0_VIDEO_TIMING_active_video => SLOT_0_VIDEO_TIMING_active_video,
      SLOT_0_VIDEO_TIMING_hblank => SLOT_0_VIDEO_TIMING_hblank,
      SLOT_0_VIDEO_TIMING_hsync => SLOT_0_VIDEO_TIMING_hsync,
      SLOT_0_VIDEO_TIMING_vblank => SLOT_0_VIDEO_TIMING_vblank,
      SLOT_0_VIDEO_TIMING_vsync => SLOT_0_VIDEO_TIMING_vsync,
      SLOT_1_AXIS_tdata(15 downto 0) => SLOT_1_AXIS_tdata(15 downto 0),
      SLOT_1_AXIS_tkeep(1 downto 0) => SLOT_1_AXIS_tkeep(1 downto 0),
      SLOT_1_AXIS_tlast => SLOT_1_AXIS_tlast,
      SLOT_1_AXIS_tready => SLOT_1_AXIS_tready,
      SLOT_1_AXIS_tuser(0) => SLOT_1_AXIS_tuser(0),
      SLOT_1_AXIS_tvalid => SLOT_1_AXIS_tvalid,
      clk => clk,
      probe0(0) => probe0(0),
      probe1(35 downto 0) => probe1(35 downto 0),
      probe10(0) => probe10(0),
      probe2(0) => probe2(0),
      probe3(0) => probe3(0),
      probe4(0) => probe4(0),
      probe5(0) => probe5(0),
      probe6(0) => probe6(0),
      probe7(0) => probe7(0),
      probe8(0) => probe8(0),
      probe9(0) => probe9(0),
      resetn => resetn
    );
end STRUCTURE;
