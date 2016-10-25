with Ada.Real_Time; use Ada.Real_Time;

package body Epoch is
   protected body PEpoch is
      function S_Start return Duration is
         t: Ada.Real_Time.Time := Ada.Real_Time.Clock;
      begin
         return Ada.Real_Time.To_Duration (t - Start_Time);
      end S_Start;

      function Since_Start return String is
      begin
         return Duration'Image (S_Start);
      end Since_Start;


      function Start_Time return Ada.Real_Time.Time is
      begin
         return Start;
      end Start_Time;

   end PEpoch;
end Epoch;
