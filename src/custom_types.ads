package Custom_Types with SPARK_Mode => on is

   type Money is digits 2;

   -- The possible states
   type State is (
                  INOPRATIVE, -- Something has gone wrong or the fuel point does not have all the data
                  CLOSED, -- THE FP is configured and no error
                  IDLE, -- The fuel pump has opened and no delivery has started
                  -- On entry, any outstanding transactions have to be stored in transaction buffer and feuling params defaulted
                  -- If idle is entered with the nozzle removed we must wait untill it is returned before allowing state change away from idle


                  CALLING, -- A user has selected a nozzle and the FP is waiting to be released
                  AUTHORISED, -- The FP is now authorised and the user can life the nozzle
                  STARTED, -- AUTHORISED and NOZZLE selected min fuel not yet selected
                  SUSPENDED_STARTED, -- The transaction was suspended while in the started state
                  SUSPENDED_FUELING, -- FP suspended after started fueling
                  FUELING -- The FP has dispensed a min amount of fuel
                 );

   -- The possible events
   type Event is (
                  MINOR_ERROR, -- A Minor error just keeps the same state
                  MAJOR_ERROR, -- A Major error goes to INOPRATIVE STATE
                  OPERATIVE, -- INOPRATIVE to CLOSED
                  UNABLE, -- CLOSED TO INOPRATIVE due to update or something
                  OPEN_FP, -- The fuel point becomes available to customer changed to IDLE state
                  VALID_NOZZLE_UP, -- User selects nozle and state changes to CALLING
                  INVALID_NOZZLE_UP, --
                  RELEASE_FP, -- CHANGES TO AUTHORISED or changes to started depending on cur state (has to be a transaction buffer abailable) and a unit price abailable
                  CLOSE_FP, -- Changed back to close state can be used to shut down FP. Back to IDLE state if in calling. Can also come from started
                  NOZZLE_DOWN, -- Customer returns nozzle that is picked up so they can select another one if the wrong one was choosen . Nozzle down from Started changed to AUTHORISED
                  FIRST_VOLUME_PULSES, -- Customer presses (TRIGGER) trigger changes to fueling state there is a min fueling volume
                  SUSPEND_FP, -- Moves into SUSPENDED_STARTED State
                  TERMINATE_FP, -- Forces FP to move to IDLE State
                  RESUME_FP, -- Back to started state
                  LIMIT_REACHED -- Max allowed limit has been pumped changes to Suspended fueling
                 );

end Custom_Types;
