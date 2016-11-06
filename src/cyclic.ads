pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with Ada.Real_Time;  use Ada.Real_Time;

package Cyclic is
   task type CyclicE(Pri: System.Priority; C_Time : Positive) is
      pragma Priority(Pri);
   end CyclicE;
end Cyclic;
