with
  Ahven.Framework;

package Unit_Tests.Memory_Streams is
   type Test is new Ahven.Framework.Test_Case with null record;

   overriding
   procedure Initialize (T : in out Test);
end Unit_Tests.Memory_Streams;
