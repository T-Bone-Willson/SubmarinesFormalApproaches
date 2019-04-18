package SubmarineSubSystem with SPARK_Mode is

   type Operational is (On, Off); -- Can Submarine Operate?

   type DoSomething is (Fire, CantFire); -- Test for actions can only be done once,
                                         -- Nuclear Submarine is operational.

   type AirDoorOne is (Closed, Open); -- Airlock door One closed or open
   type AirDoorTwo is (Closed, Open); -- Airlock door Two Closed or open

   type DoorOneLock is (Locked, Unlocked); -- Airlock door One Locked or Unlocked
   type DoorTwoLock is (Locked, Unlocked); -- Airlock door Two Locked or Unlocked


   type Submarine is record -- Items needed for Submarine to become operational
      GoodToGo : Operational;
      OpTest : DoSomething;
      ClosingOne : AirDoorOne;
      ClosingTwo : AirDoorTwo;
      LockingOne : DoorOneLock;
      LockingTwo : DoorTwoLock;
   end record;

   NuclearSubmarine : Submarine := (GoodToGo => Off, ClosingOne => Open,
                                    ClosingTwo => Closed, LockingOne => Unlocked,
                                   LockingTwo => Unlocked, OpTest => CantFire);

   -- Try to Start Submarine
   procedure StartSubmarine with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.GoodToGo = Off and then NuclearSubmarine.ClosingOne = Closed
     and then NuclearSubmarine.LockingOne = Locked and then NuclearSubmarine.ClosingTwo = Closed
     and then NuclearSubmarine.LockingTwo = Locked,
     Post => NuclearSubmarine.GoodToGo = On;

   -- Can only do if Submarine is operational, TEST!
   procedure SubmarineAction with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.GoodToGo = On and then NuclearSubmarine.ClosingOne = Closed
     and then NuclearSubmarine.LockingOne = Locked and then NuclearSubmarine.ClosingTwo = Closed
     and then NuclearSubmarine.LockingTwo = Locked,
     Post => NuclearSubmarine.OpTest = Fire;

 -----------------------------------------------------------------------------------------------
 -----------------------------------DOOR FUNCTIONALITY------------------------------------------
 -----------------------------------------------------------------------------------------------

   -- Airlock Door One can only open if Airlock Door Two is Closed. And Vide Versa
   -- These Checks are made in procedures: D1Close, D2Close, D1Open and D2 Open

   -- Airlock Door One Close
   procedure D1Close with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingOne = Open and then NuclearSubmarine.ClosingTwo = Closed,
     Post => NuclearSubmarine.ClosingOne = Closed;

   -- Airlock Door Two Close
   procedure D2Close with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingTwo = Open and then NuclearSubmarine.ClosingOne = Closed,
     Post => NuclearSubmarine.ClosingTwo = Closed;

   --Airlock Door One Lock
   procedure D1Lock with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingOne = Closed and then
     NuclearSubmarine.LockingOne = Unlocked,
     Post => NuclearSubmarine.LockingOne = Locked;

   -- Airlock Door Two Lock
   procedure D2Lock with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingTwo = Closed and then
     NuclearSubmarine.LockingTwo = Unlocked,
     Post => NuclearSubmarine.LockingTwo = Locked;

   --Airlock Door One Open
   procedure D1Open with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.LockingOne = Unlocked and then
          NuclearSubmarine.ClosingOne = Closed and then
          NuclearSubmarine.ClosingTwo = Closed,
     Post => NuclearSubmarine.ClosingOne = Open;

   -- Airlock Door Two Open
   procedure D2Open with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.LockingTwo = Unlocked and then
          NuclearSubmarine.ClosingTwo = Closed and then
          NuclearSubmarine.ClosingOne = Closed,
     Post => NuclearSubmarine.ClosingTwo = Open;

   --Airlock Door One Unlock
   procedure D1Unlock with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingOne = Closed and then NuclearSubmarine.LockingOne = Locked,
     Post => NuclearSubmarine.ClosingOne = Closed and then NuclearSubmarine.LockingOne = Unlocked;

   -- Airlock Door Two Unlock
   procedure D2Unlock with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.ClosingTwo = Closed and then NuclearSubmarine.LockingTwo = Locked,
     Post => NuclearSubmarine.ClosingTwo = Closed and then NuclearSubmarine.LockingTwo = Unlocked;

 -----------------------------------------------------------------------------------------------
 -----------------------------------END OF DOOR FUNCTIONALITY-----------------------------------
 -----------------------------------------------------------------------------------------------




end SubmarineSubSystem;
