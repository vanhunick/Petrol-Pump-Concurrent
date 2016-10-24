with Custom_Types; use Custom_Types;

package Displays with SPARK_Mode => on is


   type Display is private;

   function Create return Display;

   function Get_Amount_1(D : in Display) return Money;

   function Get_Amount_2(D : in Display) return Money;

   function Get_Amount_3(D : in Display) return Money;


   procedure Set_Amount_1(D : out Display; Amount : in Money);

   procedure Set_Amount_2(D : out Display; Amount : in Money);

   procedure Set_Amount_3(D : out Display; Amount : in Money);


   private
      type Display is
      record
         Amount_1 : Money;
         Amount_2 : Money;
         Amount_3 : Money;
      end record;


end Displays;
