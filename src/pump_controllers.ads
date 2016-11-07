with Custom_Types; use Custom_Types;

package Pump_Controllers with SPARK_Mode => on is


   type Pump_FSM is private;

   function create return Pump_FSM;

   procedure Event(Pump : in out Pump_FSM; E : in Event);


   -- Create procedures for all of the possible events/interupts
   procedure Minor_Error(Pump : in out Pump_FSM);
   procedure Major_Error(Pump : in out Pump_FSM);
   procedure Operate(Pump : in out Pump_FSM);
   procedure Unable(Pump : in out Pump_FSM);
   procedure Open_FP(Pump : in out Pump_FSM);
   procedure Valid_Nozzle_Up(Pump : in out Pump_FSM);
   procedure Invalid_Nozzle_Up(Pump : in out Pump_FSM);
   procedure Release_FP(Pump : in out Pump_FSM);
   procedure Close_FP(Pump : in out Pump_FSM);
   procedure Nozzle_Down(Pump : in out Pump_FSM);
   procedure First_Volume_Pulses(Pump : in out Pump_FSM);
   procedure Suspend_FP(Pump : in out Pump_FSM);
   procedure Terminate_FP(Pump : in out Pump_FSM);
   procedure Resume_FP(Pump : in out Pump_FSM);
   procedure Limit_Reached(Pump : in out Pump_FSM);

private

   procedure Set_State(Pump : in out Pump_FSM; S : State);

   type Pump_FSM is
      record
         Cur_State : State;
      end record;


end Pump_Controllers;
