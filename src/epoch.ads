with Ada.Real_Time;
with System;
package  Epoch is
   protected PEpoch is
      function Start_Time return Ada.Real_Time.Time;
      function S_Start return Duration;
      function Since_Start return String;
private
   pragma Priority(System.Priority'Last);
   Start : Ada.Real_Time.Time := Ada.Real_Time.Clock;
end PEpoch;
end Epoch;
