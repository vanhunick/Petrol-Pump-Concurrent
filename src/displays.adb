with Custom_Types; use Custom_Types;

package body Displays with SPARK_Mode => on is

   function Create return Display is
      New_Display : Display;
   begin
      New_Display.Amount_1 := 0.00;
      New_Display.Amount_2 := 0.00;
      New_Display.Amount_3 := 0.00;
      return New_Display;
   end Create;

   function Get_Amount_1(D : in Display) return Money is (D.Amount_1);

   function Get_Amount_2(D : in Display) return Money is (D.Amount_2);

   function Get_Amount_3(D : in Display) return Money is (D.Amount_3);

   procedure Set_Amount_1(D : out Display; Amount : in Money) is
   begin
      D.Amount_1 := Amount;
   end Set_Amount_1;

   procedure Set_Amount_2(D : out Display; Amount : in Money) is
   begin
      D.Amount_2 := Amount;
   end Set_Amount_2;

   procedure Set_Amount_3(D : out Display; Amount : in Money) is
   begin
      D.Amount_3 := Amount;
   end Set_Amount_3;





end Displays;
