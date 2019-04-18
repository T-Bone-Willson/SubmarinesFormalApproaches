package body SubmarineSubSystem with SPARK_Mode is

   procedure D1Close is
   begin
      if (NuclearSubmarine.ClosingOne = Open) then
         NuclearSubmarine.ClosingOne := Closed;
      end if;
   end D1Close;

   procedure D2Close is
   begin
      if (NuclearSubmarine.ClosingTwo = Open) then
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

  procedure StartSubmarine is
  begin
      if (NuclearSubmarine.GoodToGo = Off and then NuclearSubmarine.ClosingOne = Closed
     and then NuclearSubmarine.LockingOne = Locked and then NuclearSubmarine.ClosingTwo = Closed
          and then NuclearSubmarine.LockingTwo = Locked) then
         NuclearSubmarine.GoodToGo := On;
      end if;
  end StartSubmarine;





end SubmarineSubSystem;
