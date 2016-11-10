pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Pump_Controllers; use Pump_Controllers;
with FSMs; use FSMs;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Custom_Types; use Custom_Types;
with Pump_Units; use Pump_Units;
with Checkout; use Checkout;
with Displays; use Displays;

package forecourt is

   -- Protected data and tasks for Pump Unit 1

   -- Display for the first pump unit
   Display_1 : Display := create;

   -- Protected data for the first Pump Unit
   PU_1_Data : Protected_Pump_Unit_Data;

   -- Protected data for the pumps related to the first pump unit
   P1 : Protected_Pump_Data;
   P2 : Protected_Pump_Data;
   P3 : Protected_Pump_Data;

   -- Tasks for pump units
   PU_1_Task : Pump_Unit_1_Task(10,1_000_000);

   -- Tasks for each of the pumps
   Pump1 : Pump_1_Task(10,1_000_000);
   Pump2 : Pump_2_Task(10,1_000_000);
   Pump3 : Pump_3_Task(10,1_000_000);

   -- Protected data and tasks for the second pump unit

   -- Display for the second pump unit
   Display_2 : Display := create;

   -- Protected data for the second Pump Unit
   PU_2_Data : Protected_Pump_Unit_Data;

   -- Protected data for the pumps related to the second pump unit
   P4 : Protected_Pump_Data;
   P5 : Protected_Pump_Data;
   P6 : Protected_Pump_Data;

   -- Tasks for the pump unit
   PU_2_Task : Pump_Unit_2_Task(10,1_000_000);

   -- Tasks for pumps
   Pump4 : Pump_4_Task(10,1_000_000);
   Pump5 : Pump_5_Task(10,1_000_000);
   Pump6 : Pump_6_Task(10,1_000_000);

end forecourt;
