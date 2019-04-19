with SubmarineSubSystem; use SubmarineSubSystem;
with Ada.Text_IO; use Ada.Text_IO;

package body SubmarineSubSystem with SPARK_Mode is

 -----------------------------------------------------------------------------------------------
 -----------------------------------DOOR FUNCTIONALITY------------------------------------------
 -----------------------------------------------------------------------------------------------

   procedure D1Close is
   begin
      if (NuclearSubmarine.ClosingOne = Open and then
          NuclearSubmarine.ClosingTwo = Closed) then
         NuclearSubmarine.ClosingOne := Closed;
      end if;
   end D1Close;

   procedure D2Close is
   begin
      if (NuclearSubmarine.ClosingTwo = Open and then
          NuclearSubmarine.ClosingOne = Closed) then
         NuclearSubmarine.ClosingTwo := Closed;
      end if;
   end D2Close;

   procedure D1Lock is
   begin
      if (NuclearSubmarine.ClosingOne = Closed and then
          NuclearSubmarine.LockingOne = Unlocked) then
         NuclearSubmarine.LockingOne := Locked;
      end if;
   end D1Lock;

   procedure D2Lock is
   begin
      if (NuclearSubmarine.ClosingTwo = Closed and then
          NuclearSubmarine.LockingTwo = Unlocked) then
         NuclearSubmarine.LockingTwo := Locked;
      end if;
   end D2Lock;

   procedure D1Open is
   begin
      if (NuclearSubmarine.LockingOne = Unlocked and then
          NuclearSubmarine.ClosingOne = Closed and then
          NuclearSubmarine.ClosingTwo = Closed) then
         NuclearSubmarine.ClosingOne := Open;
      end if;
   end D1Open;

   procedure D2Open is
   begin
      if (NuclearSubmarine.LockingTwo = Unlocked and then
          NuclearSubmarine.ClosingTwo = Closed and then
          NuclearSubmarine.ClosingOne = Closed) then
         NuclearSubmarine.ClosingTwo := Open;
      end if;
   end D2Open;

   procedure D1Unlock is
   begin
      if (NuclearSubmarine.ClosingOne = Closed and then NuclearSubmarine.LockingOne = Locked) then
         NuclearSubmarine.LockingOne := Unlocked;
      end if;
   end D1Unlock;

   procedure D2Unlock is
   begin
      if (NuclearSubmarine.ClosingTwo = Closed and then NuclearSubmarine.LockingTwo = Locked) then
         NuclearSubmarine.LockingTwo := Unlocked;
      end if;
   end D2Unlock;

 -----------------------------------------------------------------------------------------------
 -----------------------------------END OF DOOR FUNCTIONALITY-----------------------------------
 -----------------------------------------------------------------------------------------------


   procedure StartSubmarine is
   begin
      if (NuclearSubmarine.GoodToGo = Off
          and then NuclearSubmarine.ClosingOne = Closed
          and then NuclearSubmarine.LockingOne = Locked
          and then NuclearSubmarine.ClosingTwo = Closed
          and then NuclearSubmarine.LockingTwo = Locked) then
         NuclearSubmarine.GoodToGo := On;
      else
         NuclearSubmarine.GoodToGo := Off;
      end if;
   end StartSubmarine;

   --procedure StartSubmarine is
   --begin
   --   while NuclearSubmarine.GoodToGo = Off
    --    and then NuclearSubmarine.ClosingOne = Closed
   --     and then NuclearSubmarine.LockingOne = Locked
   --     and then NuclearSubmarine.ClosingTwo = Closed
   --     and then NuclearSubmarine.LockingTwo = Locked loop
   --      NuclearSubmarine.GoodToGo := On;
   --      if NuclearSubmarine.GoodToGo = On then exit;
   --      else NuclearSubmarine.GoodToGo := Off;
    --     end if;

   --   end loop;
   --end StartSubmarine;

   procedure SubmarineAction is
   begin
      if (NuclearSubmarine.GoodToGo = On
          and then NuclearSubmarine.ClosingOne = Closed
          and then NuclearSubmarine.LockingOne = Locked
          and then NuclearSubmarine.ClosingTwo = Closed
          and then NuclearSubmarine.LockingTwo = Locked) then
         NuclearSubmarine.OpTest := Fire;
      else
         NuclearSubmarine.OpTest := CantFire;
      end if;
   end SubmarineAction;

-----------------------------------------------------------------------------------------------
-----------------------------------DEPTH SENSOR FUNCTIONALITY----------------------------------
-----------------------------------------------------------------------------------------------

   procedure DepthMeterCheck is
   begin
      if (NuclearSubmarine.DLevel >= 0 and NuclearSubmarine.DLevel < 5) then
        NuclearSubmarine.DStage := Nominal;
      elsif (NuclearSubmarine.DLevel >= 5 and NuclearSubmarine.DLevel < 7) then
        NuclearSubmarine.DStage := Warning;
      else
         NuclearSubmarine.DStage := Danger;
         --Put_Line("Submarine cannot go any lower! Advise going to surface!");
      end if;
   end DepthMeterCheck;

   -- Test to change Depth to Test Depth Sensor Checks
   procedure ChangeDepth is
   begin
      if (NuclearSubmarine.GoodToGo = On and then
          NuclearSubmarine.OpTest = Fire and then
          NuclearSubmarine.DDive = Dive and then
          NuclearSubmarine.DLevel < 8) then
         NuclearSubmarine.DLevel := NuclearSubmarine.Dlevel + 3;
      elsif (NuclearSubmarine.DLevel >=9) then
         NuclearSubmarine.DLevel := NuclearSubmarine.DLevel + 0;
      end if;
   end ChangeDepth;


   procedure DiveOrNot is
   begin
      if (NuclearSubmarine.GoodToGo = On and then
          NuclearSubmarine.OpTest = Fire and then
          NuclearSubmarine.DDive = Surface) then
         NuclearSubmarine.DDive := Dive;
      else
         NuclearSubmarine.DDive := Surface;
      end if;
   end DiveOrNot;

   procedure Resurface is
   begin
      if (NuclearSubmarine.GoodToGo = On and then
          NuclearSubmarine.OpTest = Fire and then
          NuclearSubmarine.DDive = Dive) then
         NuclearSubmarine.DLevel := 0;
         NuclearSubmarine.DDive := Surface;
      end if;
   end Resurface;



end SubmarineSubSystem;
