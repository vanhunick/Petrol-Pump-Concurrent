with Ada.Text_IO; use Ada.Text_IO;
with AUnit.Assertions; use AUnit.Assertions;
with Tracks; use Tracks;
with Train_Lists;
with Track_Lists;
with Station_Lists;
with Stations; use Stations;
with Trains; use Trains;
with Railways; use Railways;

package body Train_stdtest is

   -- Decleare var

   -- Called before all the test cases
   procedure Set_Up_Case (T: in out TC) is
      pragma Unreferenced (T);
   begin
      null;
   end Set_Up_Case;


   -- Called before each test
   procedure Set_Up (T : in out TC) is
   begin
      null;
   end;

   -- Called after each test
   procedure Tear_Down (T : in out TC) is
   begin
      Put_Line("Tear Down ...");
   end;

   -- Called after last test
   procedure Tear_Down_Case (T : in out TC) is
   begin
      Put_Line ("Tear Down Case ..");

   end;


   -- ===========================================================
   --                 TEST CASES/SCENARIOS
   -- ===========================================================



   procedure Register_Tests (T: in out TC) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (Test => T,Routine => Test_Create_Track'Access, Name => "Test_Create_Track");



   end Register_Tests;

   function Name (T: TC) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Tests: Standard Tests");
   end Name;

end Train_Stdtest;
