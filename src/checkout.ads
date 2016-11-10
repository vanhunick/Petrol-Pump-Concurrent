pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Pump_Units; use Pump_Units;

package Checkout is

   --Clears the pump unit acts like a customer has paid
   procedure Accept_Payment_Pump_Unit(Unit : Positive);

   --Opens the pump unit for customer use
   procedure Open_Pump_Unit(Unit : Positive);

   -- Activate the pump unit so user can start pumping
   procedure Activate_Pump_Unit(Unit : Positive);

end Checkout;
