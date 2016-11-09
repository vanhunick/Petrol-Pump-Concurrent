pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Custom_Types;
with System;
with Ada.Real_Time;  use Ada.Real_Time;

package Pump_Controllers is

   -- Tasks for pumps

   -- Dispenser one

   -- Pump 1 Task
   task type Pump_1_Task(Pri: System.Priority; Cycle_Time : Positive) is
            pragma Priority(Pri);
   end Pump_1_Task;

   -- Pump 2 Task
   task type Pump_2_Task(Pri: System.Priority; Cycle_Time : Positive) is
      pragma Priority(Pri);
   end Pump_2_Task;

   -- Pump 3 Task
   task type Pump_3_Task(Pri: System.Priority; Cycle_Time : Positive) is
         pragma Priority(Pri);
   end Pump_3_Task;

   -- Dispenser two

   -- Pump 4 Task
   task type Pump_4_Task(Pri: System.Priority; Cycle_Time : Positive) is
               pragma Priority(Pri);
   end Pump_4_Task;

   -- Pump 5 Task
   task type Pump_5_Task(Pri: System.Priority; Cycle_Time : Positive) is
               pragma Priority(Pri);
   end Pump_5_Task;

   -- Pump 6 Task
   task type Pump_6_Task(Pri: System.Priority; Cycle_Time : Positive) is
      pragma Priority(Pri);
   end Pump_6_Task;

end Pump_Controllers;
