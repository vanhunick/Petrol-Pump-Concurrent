with AUnit.Reporter.Text;
with AUnit.Run;
with Pump_Suite;
with Pump_Stdsuite;

procedure Pump_Harness is
   procedure Runner is new AUnit.Run.Test_Runner (Pump_Stdsuite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Pump_Harness;
