with Custom_Types; use Custom_Types;

package body FSMs with SPARK_Mode => on is

   function Create return Pump_FSM is
      Pump : Pump_FSM;
   begin
      Pump.Cur_State := IDLE; --CHANGE LATER
      return Pump;
   end Create;

   function Get_State(FSM : Pump_FSM) return State is (FSM.Cur_State);



   procedure Event(Pump : in out Pump_FSM; E : in Custom_Types.Event) is
   begin
      case Pump.Cur_State is
         when CLOSED => -- CLOSED STATE
            case E is
               when Open_FP => Set_State(Pump,IDLE); -- Change state from CLOSED to IDLE
               when others => null;
            end case;

         when IDLE =>  -- IDLE STATE
            case E is
               when Valid_Nozzle_Up => Set_State(Pump,CALLING); -- Change state from IDLE to CALLING
               when Release_FP => Set_State(Pump,AUTHORISED); -- Change state from IDLE to AUTHORISED
               when others => null;

            end case;

         when CALLING =>  -- IDLE STATE
            case E is
               when Nozzle_Down | Terminate_FP => Set_State(Pump,IDLE); -- Change state from CALLING to IDLE
               when Close_FP => Set_State(Pump,CLOSED); -- Change state from CALLING to CLOSED
               when Release_FP => Set_State(Pump, STARTED); -- Change state from CALLING to STARTED
               when others => null;
            end case;

         when AUTHORISED =>  -- AUTHORISED STATE
            case E is
               when Terminate_FP => Set_State(Pump,IDLE); -- Change state from AUTHORISED to IDLE
               when Close_FP => Set_State(Pump,CLOSED); -- Change state from AUTHORISED to CLOSED
               when Valid_Nozzle_Up => Set_State(Pump, STARTED); -- Change state from AUTHORISED to STARTED
               when others => null;
            end case;


         when STARTED =>  -- STARTED STATE
            case E is
               when Terminate_FP => Set_State(Pump,IDLE); -- Change state from STARTED to IDLE
               when Close_FP => Set_State(Pump,CLOSED); -- Change state from STARTED to CLOSED
               when Nozzle_Down => Set_State(Pump, IDLE); -- Change state from STARTED to IDLE
               when First_Volume_Pulses => Set_State(Pump, FUELING); -- Change state from STARTED to FUELING
               when others => null;
            end case;

         when FUELING =>  -- STARTED STATE
            case E is
               when Terminate_FP => Set_State(Pump,IDLE); -- Change state from FUELING to IDLE
               when Close_FP => Set_State(Pump,CLOSED); -- Change state from FUELING to CLOSED
               when Nozzle_Down => Set_State(Pump, IDLE); -- Change state from FUELING to IDLE
               when Limit_Reached | Suspend_FP | Tank_Full => Set_State(Pump, Suspended_Fueling); -- Change state from FUELING to Suspended Fueling
               when others => null;
            end case;


         when SUSPENDED_FUELING =>  -- SUSPENDED FUELING STATE
            case E is
               when Close_FP => Set_State(Pump,CLOSED); -- Change state from SUSPENDED_FUELING to CLOSED
               when Nozzle_Down | Terminate_FP => Set_State(Pump,IDLE); -- Change state from SUSPENDED_FUELING to IDLE
               when Resume_FP => Set_State(Pump, Suspended_Fueling); -- Change state from SUSPENDED_FUELING to Fueling
               when others => null;
            end case;

         when others => null;
      end case;
   end Event;

   procedure Clear(Pump : in out Pump_FSM) is
   begin
      Event(Pump,CLEAR);
   end Clear;

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

   procedure Set_State(Pump : in out Pump_FSM; S : State) is
   begin
      Pump.Cur_State := s;
   end Set_State;


end FSMs;
