with Custom_Types; use Custom_Types;
with Forecourt; use Forecourt;
with FSMs; use FSMs;
with System; use System;
with Epoch; use Epoch;

package body Pump_Controllers is

     procedure Set_Event(New_Event : Custom_Types.Event) is
     begin
      --          Pump_Task.E := New_Event;
      null;
     end Set_Event;


   task body Pump_1_Task is
      D : Pump_Data; -- Temp pump data

      Next_Period : Ada.Real_Time.Time;
      Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time);
      Hang_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time *10);
      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

   begin

      Next_Period := Start_Epoch + Period;

      loop
         delay until Next_Period;
         Next_Period := Next_Period + Period;

      D := Forecourt.P1.Get_Data;

      if not D.Responded then
         FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
         D.Responded := True; -- Update the data
         Forecourt.P1.Set_Data(D); -- Set the data
      end if;

      end loop;
   end Pump_1_Task;


   task body Pump_2_Task is
      D : Pump_Data; -- Temp pump data
   begin
      loop
      D := Forecourt.P2.Get_Data;

      if not D.Responded then
         FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
         D.Responded := True; -- Update the data
         Forecourt.P2.Set_Data(D); -- Set the data
      end if;
      end loop;
   end Pump_2_Task;

   task body Pump_3_Task is
      D : Pump_Data; -- Temp pump data
   begin
      loop
      D := Forecourt.P3.Get_Data;

      if not D.Responded then
         FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
         D.Responded := True; -- Update the data
         Forecourt.P3.Set_Data(D); -- Set the data
      end if;
      end loop;
   end Pump_3_Task;

   task body Pump_4_Task is
      D : Pump_Data; -- Temp pump data
   begin
      loop
         D := Forecourt.P4.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P4.Set_Data(D); -- Set the data
         end if;
      end loop;
   end Pump_4_Task;

   task body Pump_5_Task is
      D : Pump_Data; -- Temp pump data
   begin
      loop
         D := Forecourt.P5.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P5.Set_Data(D); -- Set the data
         end if;
      end loop;
   end Pump_5_Task;

   task body Pump_6_Task is
      D : Pump_Data; -- Temp pump data
   begin
      loop
         D := Forecourt.P6.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P6.Set_Data(D); -- Set the data
         end if;
      end loop;
   end Pump_6_Task;

end Pump_Controllers;
