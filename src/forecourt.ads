pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Pump_Controllers; use Pump_Controllers;
with FSMs; use FSMs;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Custom_Types; use Custom_Types;
with Pump_Units; use Pump_Units;

package forecourt is

   -- Not used at the moment
   Change_Pump_1, Change_Pump_2, Change_Pump_3 : Suspension_Object;
   Change_Pump_4, Change_Pump_5, Change_Pump_6 : Suspension_Object;
   Event_1, Event_2,Event_3,Event_4,Event_5,Event_6 : Custom_Types.Event;


   -- Dispensor 1 Finite state machine
   FSM1 : Pump_FSM := FSMs.create;

   -- Dispensor 2 Finite state machine
   FSM2 : Pump_FSM := FSMs.create;

   -- Records for each of the pumps
   P1 : Protected_Pump_Data;
   P2 : Protected_Pump_Data;
   P3 : Protected_Pump_Data;
   P4 : Protected_Pump_Data;
   P5 : Protected_Pump_Data;
   P6 : Protected_Pump_Data;

   -- Tasks for the two pump units
   PU_1_Data : Protected_Pump_Unit_Data;
   PU_2_Data : Protected_Pump_Unit_Data;

   -- Tasks for each of the pumps
   Pump1 : Pump_1_Task(10,100);
   Pump2 : Pump_2_Task(10,100);
   Pump3 : Pump_3_Task(10,100);
   Pump4 : Pump_4_Task(10,100);
   Pump5 : Pump_5_Task(10,100);
   Pump6 : Pump_6_Task(10,100);

   PU_1_Task : Pump_Unit_1_Task(10,100);
   PU_2_Task : Pump_Unit_2_Task(10,100);




end forecourt;
