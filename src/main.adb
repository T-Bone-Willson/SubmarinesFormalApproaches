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
   Put_Line("TEST!");
   D1Unlock;
   D2Unlock;
   D1Open;
   D2Open;
   StartSubmarine;
   SubmarineAction;
   Put_Line(NuclearSubmarine.LockingOne'Image);
   Put_Line(NuclearSubmarine.LockingTwo'Image);
   Put_Line(NuclearSubmarine.ClosingOne'Image);
   Put_Line(NuclearSubmarine.ClosingTwo'Image);
   Put_Line(NuclearSubmarine.GoodToGo'Image);
   Put_Line(NuclearSubmarine.OpTest'Image);














end Main;
