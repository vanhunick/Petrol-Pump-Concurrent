pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);


with forecourt; use forecourt;
with Custom_Types; use Custom_Types;

package body Checkout is


   -- Clears the current transaction in the pump unit
   procedure Accept_Payment_Pump_Unit(Unit : Positive)is
      PD : Pump_Unit_Data;
   begin
      if Unit = 1 then
         PD := Forecourt.PU_1_Data.Get_Data;
         PD.E := Custom_Types.CLEAR; -- Set event to authorised
         PD.Responded := False; -- Now when the pump unit checks it will repond to the event
         Forecourt.PU_1_Data.Set_Data(PD);
      end if;

      if Unit = 2 then
         PD := Forecourt.PU_2_Data.Get_Data;
         PD.E := Custom_Types.CLEAR; -- Set event to authorised
         PD.Responded := False; -- Now when the pump unit checks it will repond to the event
         Forecourt.PU_2_Data.Set_Data(PD);
      end if;
   end Accept_Payment_Pump_Unit;


   -- Activates a pump unit
   procedure Activate_Pump_Unit(Unit : Positive) is
   begin
      if Unit = 1 then
         PD := Forecourt.PU_1_Data.Get_Data;
         PD.E := Custom_Types.RELEASE_FP; -- Set event to authorised
         PD.Responded := False; -- Now when the pump unit checks it will repond to the event
         Forecourt.PU_1_Data.Set_Data(PD);
      end if;

      if Unit = 2 then
         PD := Forecourt.PU_2_Data.Get_Data;
         PD.E := Custom_Types.RELEASE_FP; -- Set event to authorised
         PD.Responded := False; -- Now when the pump unit checks it will repond to the event
         Forecourt.PU_2_Data.Set_Data(PD);
      end if;
   end Activate_Pump_Unit;

    -- Activates a pump unit
   procedure Terminate_Pump_Unit(Unit : Positive) is
   begin
      if Unit = 1 then
         PD := Forecourt.PU_1_Data.Get_Data;
         PD.E := Custom_Types.TERMINATE_FP; -- Set event to authorised
         PD.Responded := False; -- Now when the pump unit checks it will repond to the event
         Forecourt.PU_1_Data.Set_Data(PD);
      end if;

      if Unit = 2 then
         PD := Forecourt.PU_2_Data.Get_Data;
         PD.E := Custom_Types.TERMINATE_FP; -- Set event to authorised
         PD.Responded := False; -- Now when the pump unit checks it will repond to the event
         Forecourt.PU_2_Data.Set_Data(PD);
      end if;
   end Terminate_Pump_Unit;

end Checkout;
