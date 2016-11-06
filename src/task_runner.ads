pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Pumps;

package Task_Runner is
   Pump1 : Pump;
   Pump2 : Pump;

  Pump_Task1 : Pumps.Pump_Task(Pump1);-- No clue if right
  Pump_Task2 : Pumps.Pump_Task(Pump2);
end Task_Runner;
