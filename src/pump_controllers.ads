with Custom_Types;
with System;
with Ada.Real_Time;  use Ada.Real_Time;

package Pump_Controllers is

   -- Tasks for pumps

   -- Dispenser one
   task type Pump_1_Task(Pri: System.Priority; Cycle_Time : Positive) is
            pragma Priority(Pri);
   end Pump_1_Task;

   task type Pump_2_Task(Pri: System.Priority; C_Time : Positive);
   task type Pump_3_Task(Pri: System.Priority; C_Time : Positive);

   -- Dispenser two
   task type Pump_4_Task(Pri: System.Priority; Cycle_Time : Positive);
   task type Pump_5_Task(Pri: System.Priority; C_Time : Positive);
   task type Pump_6_Task(Pri: System.Priority; C_Time : Positive);


   procedure Set_Event(New_Event : Custom_Types.Event);

end Pump_Controllers;
