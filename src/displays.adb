with Custom_Types; use Custom_Types;

package body Displays with SPARK_Mode => on is

   function Create return Display is
      New_Display : Display;
   begin
      New_Display.Amount_1 := 0.00;
      New_Display.Amount_1 := 0.00;
      New_Display.Amount_1 := 0.00;
      return New_Display;
   end Create;


end Displays;
