with Custom_Types; use Custom_Types;

package body Pump_Controllers with SPARK_Mode => on is

   function Create return Pump_FSM is
      Pump : Pump_FSM;
   begin
      Pump.Cur_State := INOPRATIVE;
      return Pump;
   end Create;


   procedure Event(Pump : in out Pump_FSM; E : in Custom_Types.Event) is
   begin
      null;
   end Event;


   procedure Minor_Error(Pump : in out Pump_FSM) is
   begin
      Event(Pump,MINOR_ERROR);
   end Minor_Error;


   procedure Major_Error(Pump : in out Pump_FSM) is
   begin
      Event(Pump,MAJOR_ERROR);
   end Major_Error;

   procedure Operate(Pump : in out Pump_FSM) is
   begin
      Event(Pump,OPERATIVE);
   end Operate;

   procedure Unable(Pump : in out Pump_FSM) is
   begin
      Event(Pump,UNABLE);
   end Unable;

   procedure Open_FP(Pump : in out Pump_FSM) is
   begin
      Event(Pump,OPEN_FP);
   end Open_FP;

   procedure Valid_Nozzle_Up(Pump : in out Pump_FSM) is
   begin
      Event(Pump,VALID_NOZZLE_UP);
   end Valid_Nozzle_Up;


   procedure Invalid_Nozzle_Up(Pump : in out Pump_FSM) is
   begin
      Event(Pump,INVALID_NOZZLE_UP);
   end Invalid_Nozzle_Up;

   procedure Release_FP(Pump : in out Pump_FSM) is
   begin
      Event(Pump,RELEASE_FP);
   end Release_FP;

   procedure Close_FP(Pump : in out Pump_FSM) is
   begin
      Event(Pump,Close_FP);
   end Close_FP;

   procedure Nozzle_Down(Pump : in out Pump_FSM) is
   begin
      Event(Pump,NOZZLE_DOWN);
   end Nozzle_Down;

   procedure First_Volume_Pulses(Pump : in out Pump_FSM) is
   begin
      Event(Pump,FIRST_VOLUME_PULSES);
   end First_Volume_Pulses;

   procedure Suspend_FP(Pump : in out Pump_FSM) is
   begin
      Event(Pump,Suspend_FP);
   end Suspend_FP;

   procedure Terminate_FP(Pump : in out Pump_FSM) is
   begin
      Event(Pump,Terminate_FP);
   end Terminate_FP;

   procedure Resume_FP(Pump : in out Pump_FSM) is
   begin
      Event(Pump,RESUME_FP);
   end Resume_FP;

   procedure Limit_Reached(Pump : in out Pump_FSM) is
   begin
      Event(Pump,LIMIT_REACHED);
   end Limit_Reached;





end Pump_Controllers;
