pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Custom_Types; use Custom_Types;
with Pump_Controllers; use Pump_Controllers;
with Custom_Types; use Custom_Types;
with System; use System;
--  with forecourt; use forecourt;
with FSMs; use FSMs;


package Pump_Units is

   -- Event and state daya for each pump
   type Pump_Data is record
      FSM : Pump_FSM := FSMs.create;
      Cur_Event : Custom_Types.Event := Terminate_FP;
      Responded : Boolean := True;
      Pumping_Fuel : Boolean := False;
   end record;

   -- Protected wrapper for pump data
   protected type Protected_Record is

      function Get_Data return Pump_Data;

      procedure Set_Data(PD : Pump_Data);

   private
      Data : Pump_Data;
   end Protected_Record;


   protected type Pump_Unit_1 is

--      function Get_Data return Pump_Data;

      -- Procedure used to activate or deactivate a pump
      --procedure Activate_Pump(Activate : Boolean);

      procedure Event(E : Custom_Types.Event);

   private
      Data_P1 : Pump_Data;
      Data_P2 : Pump_Data;
      Data_P3 : Pump_Data;

      FSM : Pump_FSM;

      -- Cam asses the global data objects
   end Pump_Unit_1;


   -- Create a task that checks for changes to data
   task type Pump_Unit_1_Task(Pri: System.Priority; Cycle_Time : Positive);
   task type Pump_Unit_2_Task(Pri: System.Priority; Cycle_Time : Positive);







end Pump_Units;
