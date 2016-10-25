with Epoch;

package body Cyclic is
   task body CyclicE is

      Next_Period : Ada.Real_Time.Time;
      Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(C_Time);
      Hang_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Microseconds(C_Time *10);
      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

      -- Normal Declarations

   begin
      -- Initialisation code

      Next_Period := Start_Epoch + Period;
      loop
         delay until Next_Period;
         Next_Period := Next_Period + Period;

         -- Do stuff with pump
      end loop;
   end CyclicE;
end Cyclic;
