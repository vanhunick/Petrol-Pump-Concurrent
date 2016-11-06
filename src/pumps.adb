with Custom_Types; use Custom_Types;
with Pump_Controllers; use Pump_Controllers;

package body Pumps is


   function create return Pump_Type is
      A_Pump : Pump_Type;
   begin
      A_Pump.Current_State  := IDLE; -- All Pumps started in idle
      return A_Pump;
   end create;

   procedure Set_Event(New_Event : Custom_Types.Event) is
   begin
      Pump_Task.E := New_Event;
   end Set_Event;


   -- Pump task
   task body Pump_Task is
      Pump_FSM1 : Pump_FSM;
      E : Custom_Types.Event;
      Send_Event : Boolean;
   begin
      Pump_FSM1 := Pump_Controllers.create;
      Send_Event := False;

      loop
         if Send_Event then
            Pump_Controllers.Event(Pump_FSM1, E);
         end if;

      end loop;
   end Pump_Task;




end Pumps;
