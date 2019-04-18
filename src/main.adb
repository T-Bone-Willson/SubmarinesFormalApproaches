with SubmarineSubSystem; use SubmarineSubSystem;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin
   Put_Line("Nuclear Submarine is: ");
   Put_Line(NuclearSubmarine.GoodToGo'Image);
   Put_Line("Try Starting Submarine");
   StartSubmarine;
   Put_Line("Now Nuclear Submarine is: ");
   Put_Line(NuclearSubmarine.GoodToGo'Image);






end Main;
