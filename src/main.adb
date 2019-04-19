with SubmarineSubSystem; use SubmarineSubSystem;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin
   StartSubmarine;
   Put_Line("Nuclear Submarine is: ");
   Put_Line(NuclearSubmarine.GoodToGo'Image);
   Put_Line("Try Starting Submarine");
   StartSubmarine;
   Put_Line("Now Nuclear Submarine is: ");
   Put_Line(NuclearSubmarine.GoodToGo'Image);
   Put_Line("Can we Fire? ");
   SubmarineAction;
   Put_Line(NuclearSubmarine.OpTest'Image);
   Put_Line("Need to Close Both Doors to be operational: ");
   Put_Line("Airlock Door one is: ");
   Put_Line(NuclearSubmarine.ClosingOne'Image);
   Put_Line("Airlock Door two is: ");
   Put_Line(NuclearSubmarine.ClosingTwo'Image);
   Put_Line("TEST FOR BOTH DOORS CAN'T BE OPEN!");
   D2Open;
   Put_Line("Airlock Door one is: ");
   Put_Line(NuclearSubmarine.ClosingOne'Image);
   Put_Line("Airlock Door two is: ");
   Put_Line(NuclearSubmarine.ClosingTwo'Image);
   Put_Line("Airlock Door two cannot be Open if Airlock Door one is Open");
   Put_Line("NOW TEST DOOR 1 & 2 OPEN/CLOSE IN VICE VERSA!");
   D1Close;
   D2Close;
   D2Open;
   D1Open;
   Put_Line("Airlock Door one is: ");
   Put_Line(NuclearSubmarine.ClosingOne'Image);
   Put_Line("Airlock Door two is: ");
   Put_Line(NuclearSubmarine.ClosingTwo'Image);
   Put_Line("Airlock Door one cannot be Open if Airlock Door two is Open");
   Put_Line("END OF TEST");
   Put_Line("Closing Airlock Door one: ");
   D1Close;
   Put_Line("Airlock Door one is: ");
   Put_Line(NuclearSubmarine.ClosingOne'Image);
   Put_Line("Closing Airlock Door two: ");
   D2Close;
   Put_Line("Airlock Door two is: ");
   Put_Line(NuclearSubmarine.ClosingTwo'Image);
   Put_Line("Is Nuclear Submarin operational yet: ");
   StartSubmarine;
   Put_Line(NuclearSubmarine.GoodToGo'Image);
   Put_Line("Can we Fire?");
   SubmarineAction;
   Put_Line(NuclearSubmarine.OpTest'Image);
   Put_Line("Need to Lock Both Doors to be operational: ");
   Put_Line("Priming for Airlock Door locking: ");
   Put_Line("Airlock Door one lock is: ");
   Put_Line(NuclearSubmarine.LockingOne'Image);
   Put_Line("Airlock Door two lock is: ");
   Put_Line(NuclearSubmarine.LockingTwo'Image);
   Put_Line("Initiate Locking: ");
   D1Lock;
   D2Lock;
   Put_Line("Airlock Door one is: ");
   Put_Line(NuclearSubmarine.LockingOne'Image);
   Put_Line("Airlock Door two is: ");
   Put_Line(NuclearSubmarine.LockingTwo'Image);
   Put_Line("Try Opening Airlock Door one: ");
   D1Open;
   Put_Line("Status of Airlock Door one: ");
   Put_Line(NuclearSubmarine.ClosingOne'Image);
   Put_Line(NuclearSubmarine.LockingOne'Image);
   Put_Line("Lock secure!");
   Put_Line("Try Opening Airlock Door Two: ");
   D2Open;
   Put_Line("Status of Airlock Door Two: ");
   Put_Line(NuclearSubmarine.ClosingTwo'Image);
   Put_Line(NuclearSubmarine.LockingTwo'Image);
   Put_Line("Lock secure!");
   Put_Line("Is Nuclear Submarine Operational: ");
   StartSubmarine;
   Put_Line(NuclearSubmarine.GoodToGo'Image);
   Put_Line("Can we Fire?");
   SubmarineAction;
   Put_Line(NuclearSubmarine.OpTest'Image);
   Put_Line("Ready to Dive, Commence Divining");
   DiveOrNot;
   Put_Line(NuclearSubmarine.DDive'Image);
   Put_Line("State of Dive?");
   DepthMeterCheck;
   Put_Line(NuclearSubmarine.DStage'Image);
   Put_Line("Dive by 3!");
   ChangeDepth;
   Put_Line("Depth is now: ");
   Put_Line(NuclearSubmarine.DLevel'Image);
   Put("Submarine in Okay Depth Stage? "); -- Displays Submarine depth state while
   DepthMeterCheck;                        -- This line is printed... Don't know why.
   Put_Line(NuclearSubmarine.DStage'Image);
   Put_Line("Dive by 3!");
   ChangeDepth;
   Put_Line("Depth is now: ");
   Put_Line(NuclearSubmarine.DLevel'Image);
   Put("Submarine in Okay Depth Stage? ");
   DepthMeterCheck;
   Put_Line(NuclearSubmarine.DStage'Image);
   Put_Line("Dive by 3!");
   ChangeDepth;
   Put_Line("Depth is now: ");
   Put_Line(NuclearSubmarine.DLevel'Image);
   Put("Submarine in Okay Depth Stage? ");
   DepthMeterCheck;
   Put_Line(NuclearSubmarine.DStage'Image);
   Put_Line("Dive by 3!");
   ChangeDepth;
   Put_Line("Depth is now: ");
   Put_Line(NuclearSubmarine.DLevel'Image);
   Put("Submarine in Okay Depth Stage? ");
   DepthMeterCheck;
   Put_Line(NuclearSubmarine.DStage'Image);
   Put_Line("Cannot Dive any dseeper!");
   Put_Line("Taking Submarine back to Surface");
   Resurface;
   Put_Line("Submarine is: ");
   Put_Line(NuclearSubmarine.DDive'Image);
   Put_Line("Submarine Depth level is: ");
   Put_Line(NuclearSubmarine.DLevel'Image);
   Put_Line("TEST IF SUBMARINE CAN CHANGE DEPTH WHILE SURFACED");
   ChangeDepth;
   ChangeDepth;
   ChangeDepth;
   Put_Line(NuclearSubmarine.DLevel'Image);
   Put_Line("IT CANNOT! TEST OVER");


















   --Put_Line("TEST!");
   --D1Unlock;
   --StartSubmarine;
   --Put_Line(NuclearSubmarine.GoodToGo'Image);
  -- D2Unlock;
   --D1Open;
  -- D2Open;
   --StartSubmarine;
   --SubmarineAction;
   --Put_Line--(NuclearSubmarine.LockingOne'Image);
   --Put_Line(NuclearSubmarine.LockingTwo'Image);
   --Put_Line--(NuclearSubmarine.ClosingOne'Image);
   --Put_Line(NuclearSubmarine.ClosingTwo'Image);
   --Put_Line--(NuclearSubmarine.GoodToGo'Image);
   --Put_Line(NuclearSubmarine.OpTest'Image);














end Main;
