package body SubmarineSubSystem with SPARK_Mode is

   procedure StartSubmarine is
   begin
      if (NuclearSubmarine.GoodToGo = Off) then
         NuclearSubmarine.GoodToGo := On;
         end if;
   end StartSubmarine;




end SubmarineSubSystem;
