with Custom_Types;
package Pumps is

   type Pump_Type is
      record
         Current_State : Custom_Types.State;
      end record;

   function create return Pump_Type;

   procedure Set_Event(New_Event : Custom_Types.Event);



   task type Pump_Task;
end Pumps;
