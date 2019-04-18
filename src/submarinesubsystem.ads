package SubmarineSubSystem with SPARK_Mode is

   type Operational is (On, Off); -- Can Submarine Operate?

   type AirDoorOne is (Closed, Open); -- Airlock door One closed or open
   type AirDoorTwo is (Closed, Open); -- Airlock door Two Closed or open

   type DoorOneLock is (Locked, Unlocked); -- Airlock door One Locked or Unlocked
   type DoorTwoLock is (Locked, Unlocked); -- Airlock door Two Locked or Unlocked


   type Submarine is record -- Items needed for Submarine to become operational
      GoodToGo : Operational;
      ClosingOne : AirDoorOne;
      ClosingTwo : AirDoorTwo;
      LockingOne : DoorOneLock;
      LockingTwo : DoorTwoLock;
   end record;

   NuclearSubmarine : Submarine := (GoodToGo => Off, ClosingOne => Open,
                                    ClosingTwo => Open, LockingOne => Unlocked,
                                   LockingTwo => Unlocked);

   procedure StartSubmarine with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.GoodToGo = Off and then NuclearSubmarine.ClosingOne = Closed
     and then NuclearSubmarine.LockingOne = Locked and then NuclearSubmarine.ClosingTwo = Closed
     and then NuclearSubmarine.LockingTwo = Locked,
     Post => NuclearSubmarine.GoodToGo = On;

   procedure D1Close with -- Might need to add "And" for if it's opened and Unlocked
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingOne = Open,
     Post => NuclearSubmarine.ClosingOne = Closed;

   procedure D2Close with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingTwo = Open,
     Post => NuclearSubmarine.ClosingTwo = Closed;

   procedure D1Lock with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingOne = Closed and then
     NuclearSubmarine.LockingOne = Unlocked,
     Post => NuclearSubmarine.LockingOne = Locked;

   procedure D2Lock with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingTwo = Closed and then
     NuclearSubmarine.LockingTwo = Unlocked,
     Post => NuclearSubmarine.LockingTwo = Locked;





end SubmarineSubSystem;
