with Pump_Stdtest;

package body Pump_Stdsuite is

   use AUnit.Test_Suites;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      TS_Ptr : constant Access_Test_Suite := new Test_Suite;
   begin
      TS_Ptr.Add_Test (new Pump_Stdtest.TC) ;
      return TS_Ptr;
   end Suite;

end Pump_Stdsuite;
