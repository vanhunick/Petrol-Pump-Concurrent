package Pump_Units


   type Pump_Unit_1 is

      function Get_Data return Pump_Data;

      procedure Set_Data(PD : Pump_Data);

   private
      Data : Pump_Data;
   end Protected_Record;




end Pump_Unit;
