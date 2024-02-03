import env_pkg::* ; 
import agent_pkg::* ;

module tb;
    
  spi_if vif();
  
  spi dut(vif.clk,vif.newd,vif.rst,vif.din,vif.sclk,vif.cs,vif.mosi);
  
  
  
    initial begin
      vif.clk <= 0;
    end
    
    always #10 vif.clk <= ~vif.clk;
  
    environment env;
    
    
    
    initial begin
      env = new(vif);
      env.gen.count = 20;
      env.run();
    end
      
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end

    
  endmodule



////////////////////////////////////////