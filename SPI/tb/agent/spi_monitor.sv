class monitor;
  transaction tr;
  mailbox #(bit [11:0]) mbx;
  bit [11:0] srx; //////send
  

  
  virtual spi_if vif;
  
  
  function new(mailbox #(bit [11:0]) mbx);
    this.mbx = mbx;
    endfunction
  
  task run();
    
    forever begin
      @(posedge vif.sclk);
      wait(vif.cs == 1'b0); ///start of transaction
      @(posedge vif.sclk);
      
      for(int i= 0; i<= 11; i++) begin 
        @(posedge vif.sclk);
        srx[i] = vif.mosi;         
      end
      
      wait(vif.cs == 1'b1);  ///end of transaction
      
      $display("[MON] : DATA SENT : %0d", srx);
      mbx.put(srx);
     end  
    
endtask
  
 
endclass