\m4_TLV_version 1d: tl-x.org
\SV
   
	//Day 3 : Simple Calculator Using TL-Verilog
	// 2 - stage pipelined with reset and validity
	// Open it in MakerChip.com using : http://makerchip.com/sandbox/01wfphYy2/0pghn34

	// This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/bd1f186fde018ff9e3fd80597b7397a1c862cf15/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)

\TLV
   |calc
      @0
         $reset = *reset;
         $valid = $reset ? 0 : (>>1$valid + 1);
         
      ?$valid
         @1
            $val1[31:0] = >>2$out;
            //$val1[31:0] = $rand1[3:0];
            $val2[31:0] = $rand2[3:0];
            
            //Basic Arithmetic Operations
            $sum[31:0]   = $val1 + $val2;
            $sub[31:0]  = $val1 - $val2;
            $mul[31:0]  = $val1 * $val2;
            $div[31:0]  = $val1 / $val2;
         @2
            //Compute result depending on opcode 
            $out[31:0] = ($op[2:0] == 3'b000) ? $sum[31:0] :
                         ($op[2:0] == 3'b001) ? $sub[31:0] :
                         ($op[2:0] == 3'b010) ? $mul[31:0] :
                         ($op[2:0] == 3'b011) ? $div[31:0] :
                         ($op[2:0] == 3'b100) ? >>2$mem[31:0] : 32'b0;
                         
            //Hold the previous result
            $mem[31:0] = ($op[2:0] == 3'b100) ? >>2$mem[31:0] :
                         ($op[2:0] == 3'b101) ? >>2$out[31:0] : >>2$mem[31:0];
            
            
   m4+cal_viz(@3) // Arg: Pipeline stage represented by viz, should be atleast equal to last stage of CALCULATOR logic.

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   

\SV
   endmodule
