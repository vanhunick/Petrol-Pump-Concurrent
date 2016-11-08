pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Forecourt; use forecourt;




package body Task_Runner is
   PD1 : Pump_Data;
   PD2 : Pump_Data;

   PR1 : Protected_Record;
   PR2 : Protected_Record;

begin
   PR1.Set_Data(PD1);


end Task_Runner;
