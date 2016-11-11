pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Custom_Types; use Custom_Types;
with Pump_Controllers; use Pump_Controllers;
with Custom_Types; use Custom_Types;
with System; use System;
--  with forecourt; use forecourt;
with FSMs; use FSMs;


package Pump_Units with SPARK_Mode => on is


   -- Event and state daya for each pump unit
   type Pump_Unit_Data is record
      FSM : Pump_FSM := FSMs.create;
      E : Custom_Types.Event := TERMINATE_FP;
      Responded : Boolean := True;

      Pumped : Fuel_Litre :=0.00;
      Cost : Money :=0.00;
      Cur_State : Custom_Types.State := IDLE;
   end record;

   -- Protected data for each of the pump units
   protected type Protected_Pump_Unit_Data is

      function Get_Data return Pump_Unit_Data;

      procedure Set_Data(D : Pump_Unit_Data);

   private
      Data : Pump_Unit_Data;
   end Protected_Pump_Unit_Data;

   -- Create a task that checks for changes to data
   task type Pump_Unit_1_Task(Pri: System.Priority; Cycle_Time : Positive);
   task type Pump_Unit_2_Task(Pri: System.Priority; Cycle_Time : Positive);

end Pump_Units;
