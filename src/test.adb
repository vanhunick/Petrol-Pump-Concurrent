pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Ada.Text_IO; use Ada.Text_IO;
with Custom_Types; use Custom_Types;
with Forecourt; use forecourt;
with Pump_Controllers; use Pump_Controllers;
with Pump_Units; use Pump_Units;
with Checkout; use Checkout;
with Ada.Real_Time; use Ada.Real_Time;
with Epoch; use Epoch;


procedure test is
   PD : Pump_Data;
   PUD : Pump_Unit_Data;
--     The_Checkout : Checkout;

   Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;
   Next_Period : Ada.Real_Time.Time;
   Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(5_000_000);


begin
   P1.Set_Data(PD);
   P2.Set_Data(PD);
   P3.Set_Data(PD);
   P4.Set_Data(PD);
   P5.Set_Data(PD);
   P5.Set_Data(PD);

   PU_1_Data.Set_Data(PUD);
   PU_2_Data.Set_Data(PUD);

   Put_Line("Pump Unit 1 " & PU_1_Data.Get_Data.Cur_State'Image);
   Put_Line("Pump Unit 2 " & PU_2_Data.Get_Data.Cur_State'Image);

   Checkout.Activate_Pump_Unit(1);

   Next_Period := Start_Epoch + Period;

   delay until Next_Period;

   Put_Line("Pump Unit After 1 " & PU_1_Data.Get_Data.Cur_State'Image);
   Put_Line("Pump Unit After 2 " & PU_2_Data.Get_Data.Cur_State'Image);

end test;
