pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Custom_Types; use Custom_Types;
with Pump_Controllers; use Pump_Controllers;
with Custom_Types; use Custom_Types;
with System; use System;
--  with forecourt; use forecourt;
with FSMs; use FSMs;


package Pump_Units is


   -- Event and state daya for each pump unit
   type Pump_Unit_Data is record
      FSM : Pump_FSM := FSMs.create;
      E : Custom_Types.Event;
      Responded : Boolean := True;

      Data_P1 : Protected_Pump_Data;
      Data_P2 : Protected_Pump_Data;
      Data_P3 : Protected_Pump_Data;

   end record;

   -- Protected data for each of the pump units
   protected type Protected_Pump_Unit_Data is

      function Get_Data return Pump_Data;

      procedure Set_Data(Data : Pump_Unit_Data);

   private
      Data : Pump_Unit_Data;
   end Protected_Pump_Unit_Data;

   -- Create a task that checks for changes to data
   task type Pump_Unit_1_Task(Pri: System.Priority; Cycle_Time : Positive);
   task type Pump_Unit_2_Task(Pri: System.Priority; Cycle_Time : Positive);







end Pump_Units;
