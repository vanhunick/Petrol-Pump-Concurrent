with Custom_Types; use Custom_Types;

package body Displays with SPARK_Mode => on is

   function Create return Display is
      New_Display : Display;
   begin
      New_Display.Cost := 0.00;
      New_Display.Amount := 0.00;
      return New_Display;
   end Create;

   function Get_Cost(D : in Display) return Money is (D.Cost);

   procedure Set_Cost(D : in out Display; C : in Money) is
   begin
      D.Cost := C;
   end Set_Cost;

   function Get_Amount_Pumped(D : in Display) return Fuel_Litre is (D.Amount);

   procedure Set_Amount_Pumped(D : in out Display; F : in Fuel_Litre) is
   begin
      D.Amount := F;
   end Set_Amount_Pumped;

end Displays;
