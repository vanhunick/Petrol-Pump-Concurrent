with Custom_Types; use Custom_Types;

package Displays with SPARK_Mode => on is


   type Display is private;

   function Create return Display;

   private
      type Display is
      record
         Amount_1 : Money;
         Amount_2 : Money;
         Amount_3 : Money;
      end record;


end Displays;
