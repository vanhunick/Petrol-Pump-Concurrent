pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Pump_Controllers; use Pump_Controllers;
with FSMs; use FSMs;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Custom_Types; use Custom_Types;
package forecourt is

      -- Dispenser 1
--     Dispenser_1 : Dispenser;
--
--     Display_2 : Display1;



   -- Dispenser 2
--     dispenser_2 : Dispenser;

--     Display_1 : Display2;

--     Pump4 : Pump4Task;
--     Pump5 : Pump5Task;
--     Pump6 : Pump6Task;

   FSM1 : Pump_FSM := FSMs.create;
   FSM2 : Pump_FSM := FSMs.create;
   FSM3 : Pump_FSM := FSMs.create;
   FSM4 : Pump_FSM := FSMs.create;
   FSM5 : Pump_FSM := FSMs.create;
   FSM6 : Pump_FSM := FSMs.create;

   Change_Pump_1, Change_Pump_2, Change_Pump_3 : Suspension_Object;
   Change_Pump_4, Change_Pump_5, Change_Pump_6 : Suspension_Object;

   Event_1, Event_2,Event_3,Event_4,Event_5,Event_6 : Custom_Types.Event;

   type Pump_Data is record
      FSM : Pump_FSM := FSMs.create;
      Cur_Event : Custom_Types.Event := Terminate_FP;
      Responded : Boolean := True;
   end record;

   protected type Protected_Record is

      function Get_Data return Pump_Data;

      procedure Set_Data(PD : Pump_Data);

   private
      Data : Pump_Data;
   end Protected_Record;

   P1 : Protected_Record;
   P2 : Protected_Record;
   P3 : Protected_Record;
   P4 : Protected_Record;
   P5 : Protected_Record;
   P6 : Protected_Record;

   Pump1 : Pump_1_Task(10,100);
   Pump2 : Pump_2_Task(10,100);
   Pump3 : Pump_3_Task(10,100);
   Pump4 : Pump_4_Task(10,100);
   Pump5 : Pump_5_Task(10,100);
   Pump6 : Pump_6_Task(10,100);

end forecourt;
