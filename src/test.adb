pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Ada.Text_IO; use Ada.Text_IO;
with Custom_Types; use Custom_Types;
with Forecourt; use forecourt;
with Pump_Controllers; use Pump_Controllers;
with Pump_Units; use Pump_Units;


procedure test is
   PD : Pump_Data;
   PUD : Pump_Unit_Data;

begin
   P1.Set_Data(PD);
   P2.Set_Data(PD);
   P3.Set_Data(PD);
   P4.Set_Data(PD);
   P5.Set_Data(PD);
   P5.Set_Data(PD);

   PU_1_Data.Set_Data(PUD);
   PU_2_Data.Set_Data(PUD);

   Put_Line("Task 1" + p1.Get_Data.Pumping_Fuel);

end test;
