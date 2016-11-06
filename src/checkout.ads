pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Pump_Units; use Pump_Units;

package Checkout is


   procedure Accept_Payment;

   procedure Activate_Pump;


private
   P_Unit1 : Pump_Unit;
   P_Unit2 : Pump_Unit;

end Checkout;
