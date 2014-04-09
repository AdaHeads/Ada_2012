with
  Unit_Tests.Fixed_Strings;

package body Unit_Tests is
   function Suite return Ahven.Framework.Test_Suite is
      use Ahven.Framework;
      Fixed_String_Test     : Unit_Tests.Fixed_Strings.Test;
   begin
      return Suite : Test_Suite := Create_Suite ("Black") do
         Add_Static_Test (Suite, Fixed_String_Test);
      end return;
   end Suite;
end Unit_Tests;
