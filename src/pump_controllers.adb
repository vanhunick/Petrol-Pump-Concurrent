pragma Profile (Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);

with Custom_Types; use Custom_Types;
with Forecourt; use Forecourt;
with FSMs; use FSMs;
with System; use System;
with Epoch; use Epoch;
with Pump_Units; use Pump_Units;


package body Pump_Controllers is

      -- Protected record for induvidual pump data
   protected body Protected_Pump_Data is

      function Get_Data return Pump_Data is (Data);

      procedure Set_Data(PD : Pump_Data) is
      begin
         Data := PD;
      end Set_Data;

   end Protected_Pump_Data;


   task body Pump_1_Task is
      D : Pump_Data; -- Temp pump data

      -- Time update fields
      Next_Period : Ada.Real_Time.Time;
      Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time);
      Hang_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time*10);
      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

      -- Represents events going of in the pump
      Nozzle_Lifted_Event : Boolean := False;
      Nozzle_Returned_Event : Boolean := False;
      Trigger_Pulled_Event : Boolean := False;
      Trigger_Released_Event : Boolean := False;
      Tank_Full_Event : Boolean := False;

   begin
      Next_Period := Start_Epoch + Period;

      loop
         delay until Next_Period;
         Next_Period := Next_Period + Period;

         D := Forecourt.P1.Get_Data;

         -- Check if events have been triggered update data if so
         if Nozzle_Lifted_Event then
            D.Cur_Event := VALID_NOZZLE_UP;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P1.Set_Data(D);
            Nozzle_Lifted_Event := False; -- Set the event to processed
         end if;

         if Nozzle_Returned_Event then
            D.Cur_Event := NOZZLE_DOWN;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P1.Set_Data(D);
            Nozzle_Returned_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P1.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P1.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Tank_Full_Event then
            D.Cur_Event := TANK_FULL; -- Tank is full
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P1.Set_Data(D);
            Tank_Full_Event := False; -- Set the event to processed
         end if;

      end loop;
   end Pump_1_Task;


    task body Pump_2_Task is
      D : Pump_Data; -- Temp pump data

      -- Time update fields
      Next_Period : Ada.Real_Time.Time;
      Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time);
      Hang_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time*10);
      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

      -- Represents events going of in the pump
      Nozzle_Lifted_Event : Boolean := False;
      Nozzle_Returned_Event : Boolean := False;
      Trigger_Pulled_Event : Boolean := False;
      Trigger_Released_Event : Boolean := False;
      Tank_Full_Event : Boolean := False;

   begin
      Next_Period := Start_Epoch + Period;

      loop
         delay until Next_Period;
         Next_Period := Next_Period + Period;

         D := Forecourt.P2.Get_Data;

         -- Check if events have been triggered update data if so
         if Nozzle_Lifted_Event then
            D.Cur_Event := VALID_NOZZLE_UP;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P2.Set_Data(D);
            Nozzle_Lifted_Event := False; -- Set the event to processed
         end if;

         if Nozzle_Returned_Event then
            D.Cur_Event := NOZZLE_DOWN;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P2.Set_Data(D);
            Nozzle_Returned_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P2.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P2.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Tank_Full_Event then
            D.Cur_Event := TANK_FULL; -- Tank is full
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P2.Set_Data(D);
            Tank_Full_Event := False; -- Set the event to processed
         end if;

      end loop;
   end Pump_2_Task;


   task body Pump_3_Task is
      D : Pump_Data; -- Temp pump data

      -- Time update fields
      Next_Period : Ada.Real_Time.Time;
      Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time);
      Hang_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time*10);
      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

      -- Represents events going of in the pump
      Nozzle_Lifted_Event : Boolean := False;
      Nozzle_Returned_Event : Boolean := False;
      Trigger_Pulled_Event : Boolean := False;
      Trigger_Released_Event : Boolean := False;
      Tank_Full_Event : Boolean := False;

   begin
      Next_Period := Start_Epoch + Period;

      loop
         delay until Next_Period;
         Next_Period := Next_Period + Period;

         D := Forecourt.P3.Get_Data;

         -- Check if events have been triggered update data if so
         if Nozzle_Lifted_Event then
            D.Cur_Event := VALID_NOZZLE_UP;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P3.Set_Data(D);
            Nozzle_Lifted_Event := False; -- Set the event to processed
         end if;

         if Nozzle_Returned_Event then
            D.Cur_Event := NOZZLE_DOWN;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P3.Set_Data(D);
            Nozzle_Returned_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P3.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P3.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Tank_Full_Event then
            D.Cur_Event := TANK_FULL; -- Tank is full
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P3.Set_Data(D);
            Tank_Full_Event := False; -- Set the event to processed
         end if;

      end loop;
   end Pump_3_Task;



   task body Pump_4_Task is
      D : Pump_Data; -- Temp pump data

      -- Time update fields
      Next_Period : Ada.Real_Time.Time;
      Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time);
      Hang_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time*10);
      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

      -- Represents events going of in the pump
      Nozzle_Lifted_Event : Boolean := False;
      Nozzle_Returned_Event : Boolean := False;
      Trigger_Pulled_Event : Boolean := False;
      Trigger_Released_Event : Boolean := False;
      Tank_Full_Event : Boolean := False;

   begin
      Next_Period := Start_Epoch + Period;

      loop
         delay until Next_Period;
         Next_Period := Next_Period + Period;

         D := Forecourt.P4.Get_Data;

         -- Check if events have been triggered update data if so
         if Nozzle_Lifted_Event then
            D.Cur_Event := VALID_NOZZLE_UP;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P4.Set_Data(D);
            Nozzle_Lifted_Event := False; -- Set the event to processed
         end if;

         if Nozzle_Returned_Event then
            D.Cur_Event := NOZZLE_DOWN;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P4.Set_Data(D);
            Nozzle_Returned_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P4.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P4.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Tank_Full_Event then
            D.Cur_Event := TANK_FULL; -- Tank is full
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P4.Set_Data(D);
            Tank_Full_Event := False; -- Set the event to processed
         end if;

      end loop;
   end Pump_4_Task;

   task body Pump_5_Task is
      D : Pump_Data; -- Temp pump data

      -- Time update fields
      Next_Period : Ada.Real_Time.Time;
      Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time);
      Hang_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time*10);
      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

      -- Represents events going of in the pump
      Nozzle_Lifted_Event : Boolean := False;
      Nozzle_Returned_Event : Boolean := False;
      Trigger_Pulled_Event : Boolean := False;
      Trigger_Released_Event : Boolean := False;
      Tank_Full_Event : Boolean := False;

   begin
      Next_Period := Start_Epoch + Period;

      loop
         delay until Next_Period;
         Next_Period := Next_Period + Period;

         D := Forecourt.P5.Get_Data;

         -- Check if events have been triggered update data if so
         if Nozzle_Lifted_Event then
            D.Cur_Event := VALID_NOZZLE_UP;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P5.Set_Data(D);
            Nozzle_Lifted_Event := False; -- Set the event to processed
         end if;

         if Nozzle_Returned_Event then
            D.Cur_Event := NOZZLE_DOWN;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P5.Set_Data(D);
            Nozzle_Returned_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P5.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P5.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Tank_Full_Event then
            D.Cur_Event := TANK_FULL; -- Tank is full
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P5.Set_Data(D);
            Tank_Full_Event := False; -- Set the event to processed
         end if;

      end loop;
   end Pump_5_Task;

   task body Pump_6_Task is
      D : Pump_Data; -- Temp pump data

      -- Time update fields
      Next_Period : Ada.Real_Time.Time;
      Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time);
      Hang_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(Cycle_Time*10);
      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

      -- Represents events going of in the pump
      Nozzle_Lifted_Event : Boolean := False;
      Nozzle_Returned_Event : Boolean := False;
      Trigger_Pulled_Event : Boolean := False;
      Trigger_Released_Event : Boolean := False;
      Tank_Full_Event : Boolean := False;

   begin
      Next_Period := Start_Epoch + Period;

      loop
         delay until Next_Period;
         Next_Period := Next_Period + Period;

         D := Forecourt.P6.Get_Data;

         -- Check if events have been triggered update data if so
         if Nozzle_Lifted_Event then
            D.Cur_Event := VALID_NOZZLE_UP;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P6.Set_Data(D);
            Nozzle_Lifted_Event := False; -- Set the event to processed
         end if;

         if Nozzle_Returned_Event then
            D.Cur_Event := NOZZLE_DOWN;
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P6.Set_Data(D);
            Nozzle_Returned_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P6.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Trigger_Pulled_Event then
            D.Cur_Event := FIRST_VOLUME_PULSES; -- Trigger pulled
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P6.Set_Data(D);
            Trigger_Pulled_Event := False; -- Set the event to processed
         end if;

         if Tank_Full_Event then
            D.Cur_Event := TANK_FULL; -- Tank is full
            D.Responded := False; -- Make the pump unit process the event
            Forecourt.P6.Set_Data(D);
            Tank_Full_Event := False; -- Set the event to processed
         end if;

      end loop;
   end Pump_6_Task;

end Pump_Controllers;
