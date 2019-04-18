with SubmarineSubSystem; use SubmarineSubSystem;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin
   --Put_Line--("Nuclear Submarine is: ");
   --Put_Line--(NuclearSubmarine.GoodToGo'Image);
   --Put_Line("Try Starting Submarine");
   --StartSubmarine;
   --Put_Line--("Now Nuclear Submarine is: ");
   --Put_Line(NuclearSubmarine.GoodToGo'Image);

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












end Main;
