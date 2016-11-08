pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Ada.Text_IO; use Ada.Text_IO;
with Custom_Types; use Custom_Types;
with Forecourt; use forecourt;
with Pump_Controllers; use Pump_Controllers;


procedure test is
   PD1 : Pump_Data;
   D : Pump_Data := PD1;

begin
   P1.Set_Data(PD1);
   P2.Set_Data(PD1);
   P3.Set_Data(PD1);
   P4.Set_Data(PD1);
   P5.Set_Data(PD1);
   P5.Set_Data(PD1);

   D.Cur_Event := Nozzle_Down;

   Put_Line(P2.Get_Data.Cur_Event'Image);

   P2.Set_Data(D);

   Put_Line(P2.Get_Data.Cur_Event'Image);


end test;
