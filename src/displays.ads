with Custom_Types; use Custom_Types;

package Displays with SPARK_Mode => on is


   type Display is private;

   function Create return Display;

   procedure Set_Amount_Pumped(D : in out Display; F : in Fuel_Litre);

   function Get_Amount_Pumped(D : in Display)return Fuel_Litre;

   procedure Set_Cost(D : in out Display; C :  in Money);

   function Get_Cost(D : in Display)return Money;

private
   type Display is
      record
         Cost : Money;
         Amount : Fuel_Litre;
      end record;

end Displays;
