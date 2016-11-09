pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Pump_Units; use Pump_Units;

package Checkout is


   procedure Accept_Payment_Pump_Unit(Unit : Positive);

   procedure Activate_Pump_Unit(Unit : Positive);


private
--     P_Unit1 : Pump_Unit;
--     P_Unit2 : Pump_Unit;
--
--     PU1_Balance : Money;
--     PU2_Balance : Money;

end Checkout;
