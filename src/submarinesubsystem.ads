package SubmarineSubSystem with SPARK_Mode is

   type Operational is (On, Off);

   type Submarine is record
      GoodToGo : Operational;
   end record;

   NuclearSubmarine : Submarine := (GoodToGo => Off);

   procedure StartSubmarine with
     Global => (In_Out => NuclearSubmarine),
     Pre => NuclearSubmarine.GoodToGo = Off,
     Post => NuclearSubmarine.GoodToGo = On;



end SubmarineSubSystem;
