with forecourt; use forecourt;
with Custom_Types; use Custom_Types;

package body Checkout is


   -- Clears the current transaction in the pump unit
   procedure Accept_Payment_Pump_Unit(Unit : Positive)is
   begin
      if Unit = 1 then
               forecourt.PU_1.Clear_Balance;
      end if;

      if Unit = 2 then
               forecourt.PU_1.Clear_Balance;
      end if;
   end Accept_Payment_Pump_Unit;


   -- Activates a pump unit
   procedure Activate_Pump_Unit(Unit : Positive) is
   begin
      if Unit = 1 then
         forecourt.PU_1.Event(RELEASE_FP); -- Send event to authorise pump unit
      end if;

      if Unit = 2 then
         forecourt.PU_2.Event(RELEASE_FP); -- Send event to authorise pump unit
      end if;
   end Activate_Pump_Unit;

    -- Activates a pump unit
   procedure Terminate_Pump_Unit(Unit : Positive) is
   begin
      if Unit = 1 then
         forecourt.PU_1.Event(TERMINATE_FP); -- Send event to authorise pump unit
      end if;

      if Unit = 2 then
         forecourt.PU_2.Event(TERMINATE_FP); -- Send event to authorise pump unit
      end if;
   end Terminate_Pump_Unit;


end Checkout;
