module func_mux4(
  input A,
  input B,
  input C,
  output F
);

  ///////////////////////////////////////////////////////////////////////////////////////////
  // Put your name below...if you worked with a partner ensure there name is also present //
  /////////////////////////////////////////////////////////////////////////////////////////
  //Peter Zhao

  /////////////////////////////////////////////////////////////////////
  // Declare any needed internal signals as type "logic" below here //
  ///////////////////////////////////////////////////////////////////
	logic notC;

  ////////////////////////////////////////////////////////
  // You might need a complement of one of the inputs  //
  // do that below using the built in "not" primitive //
  /////////////////////////////////////////////////////
	not (notC, C);
  
  ///////////////////////////////////////////////////////////////////
  // Instantiation of 4:1 Mux.  You hook up inputs to the selects //
  // and 1'b1's or 1'b0's or inputs (or complement of inputs) to //
  // the data INs to achieve specified functionality.           //
  ///////////////////////////////////////////////////////////////
  mux4_2_1 iMX(	.SEL1(A),
				.SEL0(B), 
				.IN0(notC), 
				.IN1(notC), 
				.IN2(1'b0), 
				.IN3(1'b1), 
				.OUT(F));
  
endmodule

///////////////////////////////////////////////////////////////////
// Below is model of 4:1 mux.  Don't modify anything below here //
/////////////////////////////////////////////////////////////////
module mux4_2_1(
  input SEL1, SEL0,
  input IN0,IN1,IN2,IN3,
  output OUT
);

  assign OUT = ({SEL1,SEL0}===2'b00) ? IN0 :
               ({SEL1,SEL0}===2'b01) ? IN1 :
               ({SEL1,SEL0}===2'b10) ? IN2 :
			   ({SEL1,SEL0}===2'b11) ? IN3 :
			   1'bx;

endmodule