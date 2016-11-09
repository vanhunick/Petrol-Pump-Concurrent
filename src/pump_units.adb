with Custom_Types; use Custom_Types;
with Forecourt; use Forecourt;
with FSMs; use FSMs;
with System; use System;
with Epoch; use Epoch;
with Pump_Units; use Pump_Units;
with Ada.Real_Time; use Ada.Real_Time;



package body Pump_Units is

   -- Task for the first pump unit
   task body Pump_Unit_1_Task is
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

         -- Check pump one for events
         D := Forecourt.P1.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P1.Set_Data(D); -- Set the data
         end if;

         -- Check pump 2 for events
         D := Forecourt.P2.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P2.Set_Data(D); -- Set the data
         end if;

         -- Check pump 3 for events
         D := Forecourt.P3.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P3.Set_Data(D); -- Set the data
         end if;

      end loop;
   end Pump_Unit_1_Task;


   -- Task for the second pump unit
   task body Pump_Unit_2_Task is
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

         -- Check pump four for events
         D := Forecourt.P4.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P4.Set_Data(D); -- Set the data
         end if;

         -- Check pump 5 for events
         D := Forecourt.P5.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P5.Set_Data(D); -- Set the data
         end if;

         -- Check pump 6 for events
         D := Forecourt.P6.Get_Data;

         if not D.Responded then
            FSMS.Event(D.FSM, D.Cur_Event); -- Send the event to FSM
            D.Responded := True; -- Update the data
            Forecourt.P6.Set_Data(D); -- Set the data
         end if;

      end loop;
   end Pump_Unit_2_Task;

   -- Protected object to send data to the pump units
   protected body Pump_Unit_Data is

      function Get_Data return Pump_Unit_Data is (Data);

      procedure Set_Data(D : Pump_Unit_Data) is
      begin
         Data := D;
      end Set_Data;

   end Pump_Unit_Data;

end Pump_Units;
