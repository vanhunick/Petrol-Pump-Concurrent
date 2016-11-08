with Pump_Controllers; use Pump_Controllers;
with FSMs; use FSMs;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Forecourt is


   protected body Protected_Record is

      function Get_Data return Pump_Data is (Data);

      procedure Set_Data(PD : Pump_Data) is
      begin
         Data := PD;
      end Set_Data;

   end Protected_Record;


end Forecourt;
