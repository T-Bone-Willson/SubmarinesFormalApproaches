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



   --This procedure was made when I wanted to test if the Submarien could do something,
   -- ONLY when the NuclearSubmarine.GoodToGo = On. This was so I could see in the main File
   -- If the submarine could or could not perform actions while it was On and Off.
   -- As I developed the other systems though (Doors/locking was first, followed by
   -- submarine becoming operational) this procedure/Pre condition became a main stay with all the
   -- other features as along as the Submaine is operational.
   -- It now essentially acts as a "Two Stage" operational verification condition. Submarine
   -- CANNOT perform any actions (excluding door or locking related) unless
   -- NuclearSubmarine.GoodToGo = On and then NuclearSubmarine.OpTest = Fire
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
          NuclearSubmarine.DDive = Surface and then
          NuclearSubmarine.RTemp = Fine) then
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
         NuclearSubmarine.OTank := 100;
      end if;
   end Resurface;

-----------------------------------------------------------------------------------------------
--------------------------- END OF DEPTH SENSOR FUNCTIONALITY----------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
----------------------------------- OXYGEN FUNCTIONALITY --------------------------------------
-----------------------------------------------------------------------------------------------

   -- Checks Oxygen reserves within OTank. if less than a specific amount then
   -- Adjust it's OSate
   procedure OxygenReserveCheck is
   begin
      if (NuclearSubmarine.OTank = 100 or NuclearSubmarine.OTank > 30) then
         NuclearSubmarine.OState := High;
      elsif (NuclearSubmarine.OTank <= 30 and NuclearSubmarine.OTank >=1) then
         NuclearSubmarine.OState := Low;
         NuclearSubmarine.OWarning := Oxygen_Warning;
         --Put_Line(NuclearSubmarine.OWarning'Image);
      end if;
   end OxygenReserveCheck;

   procedure ConsumeOxygen is
   begin
      if (NuclearSubmarine.GoodToGo = On and then
          NuclearSubmarine.OpTest = Fire and then
          NuclearSubmarine.DDive = Dive and then
          NuclearSubmarine.OTank >= 31) then
         NuclearSubmarine.OTank := NuclearSubmarine.OTank - 10;
      elsif (NuclearSubmarine.OTank <= 30 and NuclearSubmarine.OTank >= 10) then
         NuclearSubmarine.OTank := NuclearSubmarine.OTank - 10;
         NuclearSubmarine.OWarning := Oxygen_Warning;
         Put_Line(NuclearSubmarine.OWarning'Image); -- Don't know how to proof a Put_Line.
      elsif (NuclearSubmarine.OTank < 10) then
         -- List of states that will be printed in "main" when
         -- The Submarine runs out of oxygen.
         Put_Line(NuclearSubmarine.OWarning'Image); -- Don't know how to proof a Put_Line.
         Put_Line("Submarine has to resurface!"); -- Don't know how to proof a Put_Line.
         -- Submarine will resruface when this condition has been met
         Resurface;
         Put_Line(NuclearSubmarine.DDive'Image); -- Don't know how to proof a Put_Line.
         Put_Line("Submarine has now resurfaced"); -- Don't know how to proof a Put_Line.
      end if;
   end ConsumeOxygen;

-----------------------------------------------------------------------------------------------
------------------------------- END OF OXYGEN FUNCTIONALITY -----------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
----------------------------------- REACTOR FUNCTIONALITY -------------------------------------
-----------------------------------------------------------------------------------------------

   procedure ReactorOverheatRoutine is
   begin
      if (NuclearSubmarine.GoodToGo = on and then
          NuclearSubmarine.OpTest = Fire and then
          NuclearSubmarine.RTemp = Fine and then
          NuclearSubmarine.DDive = Dive) then
         -- Post Condition Triggers here because it cannot prove if RTemp is Overhearing or not
         -- I find that odd though because the code below makes it so RTemp = Fine to
         -- RTemp = Overheating. Therefore would trigger the NuclearSubmarine.RTemp = Overheating
         -- Post Condition. I cannot figure out why this is a problem and so I have to leave
         -- It as it as it is, because I have ran out of time to finish this assignment.
         -- This procedure will still pass "Bronze" level of Proofing
         NuclearSubmarine.RTemp := Overheating;
         Put_Line("The Reactor is: "); -- Don't know how to proof a Put_Line.
         Put_Line(NuclearSubmarine.RTemp'Image); -- Don't know how to proof a Put_Line.
         Put_Line("Reactor is Overheating, must resurface!"); -- Don't know how to proof a Put_Line.
         Resurface;
         Put_Line(NuclearSubmarine.DDive'Image); -- Don't know how to proof a Put_Line.
      end if;
   end ReactorOverheatRoutine;


   procedure CoolReactor is
   begin
      if (NuclearSubmarine.GoodToGo = on and then
          NuclearSubmarine.OpTest = Fire and then
          NuclearSubmarine.DDive = Surface and then
          NuclearSubmarine.RTemp = Overheating) then
         NuclearSubmarine.RTemp := Fine;
      else
         -- Don't know how to proof a Put_Line.
         Put_Line("Conditions have not been met to cool the reactor. Reactor is still: ");
         Put_Line(NuclearSubmarine.RTemp'Image); -- Don't know how to proof a Put_Line.
      end if;
   end CoolReactor;

-----------------------------------------------------------------------------------------------
------------------------------- END OF REACTOR FUNCTIONALITY ----------------------------------
-----------------------------------------------------------------------------------------------


end SubmarineSubSystem;
