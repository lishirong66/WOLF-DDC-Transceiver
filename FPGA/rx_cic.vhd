-- -------------------------------------------------------------
--
-- Module: rx_cic
-- Generated by MATLAB(R) 9.6 and Filter Design HDL Coder 3.1.5.
-- Generated on: 2019-04-12 16:30:27
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- OptimizeForHDL: on
-- EDAScriptGeneration: off
-- Name: rx_cic
-- TestBenchName: rx_cic_tb
-- TestBenchStimulus: step ramp chirp noise 
-- GenerateHDLTestBench: off

-- -------------------------------------------------------------
-- HDL Implementation    : Fully parallel
-- -------------------------------------------------------------
-- Filter Settings:
--
-- Discrete-Time FIR Multirate Filter (real)
-- -----------------------------------------
-- Filter Structure    : Cascaded Integrator-Comb Decimator
-- Decimation Factor   : 512
-- Differential Delay  : 1
-- Number of Sections  : 5
-- Stable              : Yes
-- Linear Phase        : Yes (Type 2)
--
-- -------------------------------------------------------------



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY rx_cic IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    std_logic_vector(22 DOWNTO 0); -- sfix23_En22
         filter_out                      :   OUT   std_logic_vector(15 DOWNTO 0); -- sfix16_E30
         ce_out                          :   OUT   std_logic  
         );

END rx_cic;


----------------------------------------------------------------
--Module Architecture: rx_cic
----------------------------------------------------------------
ARCHITECTURE rtl OF rx_cic IS
  -- Local Functions
  -- Type Definitions
  -- Constants
  -- Signals
  SIGNAL cur_count                        : unsigned(8 DOWNTO 0); -- ufix9
  SIGNAL phase_1                          : std_logic; -- boolean
  SIGNAL ce_out_reg                       : std_logic; -- boolean
  --   
  SIGNAL input_register                   : signed(22 DOWNTO 0); -- sfix23_En22
  --   -- Section 1 Signals 
  SIGNAL section_in1                      : signed(22 DOWNTO 0); -- sfix23_En22
  SIGNAL section_cast1                    : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sum1                             : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out1                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast                         : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_1                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_temp                         : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 2 Signals 
  SIGNAL section_in2                      : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sum2                             : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out2                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_2                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_3                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_temp_1                       : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 3 Signals 
  SIGNAL section_in3                      : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sum3                             : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out3                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_4                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_5                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_temp_2                       : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 4 Signals 
  SIGNAL section_in4                      : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sum4                             : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out4                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_6                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_7                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_temp_3                       : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 5 Signals 
  SIGNAL section_in5                      : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sum5                             : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out5                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_8                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_cast_9                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL add_temp_4                       : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 6 Signals 
  SIGNAL section_in6                      : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL diff1                            : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out6                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast                         : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_1                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_temp                         : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 7 Signals 
  SIGNAL section_in7                      : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL diff2                            : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out7                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_2                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_3                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_temp_1                       : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 8 Signals 
  SIGNAL section_in8                      : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL diff3                            : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out8                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_4                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_5                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_temp_2                       : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 9 Signals 
  SIGNAL section_in9                      : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL diff4                            : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out9                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_6                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_7                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_temp_3                       : signed(60 DOWNTO 0); -- sfix61_En14
  --   -- Section 10 Signals 
  SIGNAL section_in10                     : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL diff5                            : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL section_out10                    : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_8                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_cast_9                       : signed(59 DOWNTO 0); -- sfix60_En14
  SIGNAL sub_temp_4                       : signed(60 DOWNTO 0); -- sfix61_En14
  SIGNAL output_typeconvert               : signed(15 DOWNTO 0); -- sfix16_E30
  --   
  SIGNAL output_register                  : signed(15 DOWNTO 0); -- sfix16_E30


BEGIN

  -- Block Statements
  --   ------------------ CE Output Generation ------------------

  ce_output : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      cur_count <= to_unsigned(0, 9);
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        IF cur_count >= to_unsigned(511, 9) THEN
          cur_count <= to_unsigned(0, 9);
        ELSE
          cur_count <= cur_count + to_unsigned(1, 9);
        END IF;
      END IF;
    END IF; 
  END PROCESS ce_output;

  phase_1 <= '1' WHEN cur_count = to_unsigned(1, 9) AND clk_enable = '1' ELSE '0';

  --   ------------------ CE Output Register ------------------

  ce_output_register : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      ce_out_reg <= '0';
    ELSIF clk'event AND clk = '1' THEN
      ce_out_reg <= phase_1;
      
    END IF; 
  END PROCESS ce_output_register;

  --   ------------------ Input Register ------------------

  input_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      input_register <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        input_register <= signed(filter_in);
      END IF;
    END IF; 
  END PROCESS input_reg_process;

  --   ------------------ Section # 1 : Integrator ------------------

  section_in1 <= input_register;

  section_cast1 <= resize(section_in1(22 DOWNTO 8), 60);

  add_cast <= section_cast1;
  add_cast_1 <= section_out1;
  add_temp <= resize(add_cast, 61) + resize(add_cast_1, 61);
  sum1 <= add_temp(59 DOWNTO 0);

  integrator_delay_section1 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      section_out1 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        section_out1 <= sum1;
      END IF;
    END IF; 
  END PROCESS integrator_delay_section1;

  --   ------------------ Section # 2 : Integrator ------------------

  section_in2 <= section_out1;

  add_cast_2 <= section_in2;
  add_cast_3 <= section_out2;
  add_temp_1 <= resize(add_cast_2, 61) + resize(add_cast_3, 61);
  sum2 <= add_temp_1(59 DOWNTO 0);

  integrator_delay_section2 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      section_out2 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        section_out2 <= sum2;
      END IF;
    END IF; 
  END PROCESS integrator_delay_section2;

  --   ------------------ Section # 3 : Integrator ------------------

  section_in3 <= section_out2;

  add_cast_4 <= section_in3;
  add_cast_5 <= section_out3;
  add_temp_2 <= resize(add_cast_4, 61) + resize(add_cast_5, 61);
  sum3 <= add_temp_2(59 DOWNTO 0);

  integrator_delay_section3 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      section_out3 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        section_out3 <= sum3;
      END IF;
    END IF; 
  END PROCESS integrator_delay_section3;

  --   ------------------ Section # 4 : Integrator ------------------

  section_in4 <= section_out3;

  add_cast_6 <= section_in4;
  add_cast_7 <= section_out4;
  add_temp_3 <= resize(add_cast_6, 61) + resize(add_cast_7, 61);
  sum4 <= add_temp_3(59 DOWNTO 0);

  integrator_delay_section4 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      section_out4 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        section_out4 <= sum4;
      END IF;
    END IF; 
  END PROCESS integrator_delay_section4;

  --   ------------------ Section # 5 : Integrator ------------------

  section_in5 <= section_out4;

  add_cast_8 <= section_in5;
  add_cast_9 <= section_out5;
  add_temp_4 <= resize(add_cast_8, 61) + resize(add_cast_9, 61);
  sum5 <= add_temp_4(59 DOWNTO 0);

  integrator_delay_section5 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      section_out5 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        section_out5 <= sum5;
      END IF;
    END IF; 
  END PROCESS integrator_delay_section5;

  --   ------------------ Section # 6 : Comb ------------------

  section_in6 <= section_out5;

  sub_cast <= section_in6;
  sub_cast_1 <= diff1;
  sub_temp <= resize(sub_cast, 61) - resize(sub_cast_1, 61);
  section_out6 <= sub_temp(59 DOWNTO 0);

  comb_delay_section6 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      diff1 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF phase_1 = '1' THEN
        diff1 <= section_in6;
      END IF;
    END IF; 
  END PROCESS comb_delay_section6;

  --   ------------------ Section # 7 : Comb ------------------

  section_in7 <= section_out6;

  sub_cast_2 <= section_in7;
  sub_cast_3 <= diff2;
  sub_temp_1 <= resize(sub_cast_2, 61) - resize(sub_cast_3, 61);
  section_out7 <= sub_temp_1(59 DOWNTO 0);

  comb_delay_section7 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      diff2 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF phase_1 = '1' THEN
        diff2 <= section_in7;
      END IF;
    END IF; 
  END PROCESS comb_delay_section7;

  --   ------------------ Section # 8 : Comb ------------------

  section_in8 <= section_out7;

  sub_cast_4 <= section_in8;
  sub_cast_5 <= diff3;
  sub_temp_2 <= resize(sub_cast_4, 61) - resize(sub_cast_5, 61);
  section_out8 <= sub_temp_2(59 DOWNTO 0);

  comb_delay_section8 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      diff3 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF phase_1 = '1' THEN
        diff3 <= section_in8;
      END IF;
    END IF; 
  END PROCESS comb_delay_section8;

  --   ------------------ Section # 9 : Comb ------------------

  section_in9 <= section_out8;

  sub_cast_6 <= section_in9;
  sub_cast_7 <= diff4;
  sub_temp_3 <= resize(sub_cast_6, 61) - resize(sub_cast_7, 61);
  section_out9 <= sub_temp_3(59 DOWNTO 0);

  comb_delay_section9 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      diff4 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF phase_1 = '1' THEN
        diff4 <= section_in9;
      END IF;
    END IF; 
  END PROCESS comb_delay_section9;

  --   ------------------ Section # 10 : Comb ------------------

  section_in10 <= section_out9;

  sub_cast_8 <= section_in10;
  sub_cast_9 <= diff5;
  sub_temp_4 <= resize(sub_cast_8, 61) - resize(sub_cast_9, 61);
  section_out10 <= sub_temp_4(59 DOWNTO 0);

  comb_delay_section10 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      diff5 <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF phase_1 = '1' THEN
        diff5 <= section_in10;
      END IF;
    END IF; 
  END PROCESS comb_delay_section10;

  output_typeconvert <= section_out10(59 DOWNTO 44);

  --   ------------------ Output Register ------------------

  output_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      output_register <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF phase_1 = '1' THEN
        output_register <= output_typeconvert;
      END IF;
    END IF; 
  END PROCESS output_reg_process;

  -- Assignment Statements
  ce_out <= ce_out_reg;
  filter_out <= std_logic_vector(output_register);
END rtl;
