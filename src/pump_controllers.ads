pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Custom_Types;
with System;
with Ada.Real_Time;  use Ada.Real_Time;
with FSMs; use FSMs;

package Pump_Controllers is

   -- Event and state daya for each pump
   type Pump_Data is record
      Cur_Event    : Custom_Types.Event := Custom_Types.TERMINATE_FP;
      Responded    : Boolean := True;
      Pumping_Fuel : Boolean := False;
   end record;


   -- Protected wrapper for pump data
   protected type Protected_Pump_Data is

      function Get_Data return Pump_Data;

      procedure Set_Data(PD : Pump_Data);

   private
      Data : Pump_Data;
   end Protected_Pump_Data;



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
