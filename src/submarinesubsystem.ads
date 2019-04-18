package SubmarineSubSystem with SPARK_Mode is

   type Operational is (On, Off);

   type Submarine is record
      GoodToGo : Operational;
   end record;

   NuclearSubmarine : Submarine := (GoodToGo => Off);





end SubmarineSubSystem;
