with
  Ada_2012.Strings.Equal_Case_Insensitive,
  Ada_2012.Strings.Less_Case_Insensitive;

package body Unit_Tests.Fixed_Strings is
   type Compares is ('<', '=', '>');

   generic
      Left       : String;
      Comparison : Compares;
      Right      : String;
   procedure Check;

   procedure Check is
      procedure Equal (Left, Right : in String) return Boolean
        renames Ada_2012.Strings.Equal_Case_Insensitive;
      procedure Less  (Left, Right : in String) return Boolean
        renames Ada_2012.Strings.Less_Case_Insensitive;
   begin
      case Comparison is
         when '<' =>
            Assert (not Equal (Left, Right), "Equal_Case_Insensitive");
            Assert (not Equal (Right, Left), "Equal_Case_Insensitive");

            Assert (Less (Left, Right),      "Less_Case_Insensitive");
            Assert (not Less (Right, Left),  "Less_Case_Insensitive");
         when '=' =>
            Assert (Equal (Left, Right),     "Equal_Case_Insensitive");
            Assert (Equal (Right, Left),     "Equal_Case_Insensitive");

            Assert (not Less (Left, Right),  "Less_Case_Insensitive");
            Assert (not Less (Right, Left),  "Less_Case_Insensitive");
         when '>' =>
            Assert (not Equal (Left, Right), "Equal_Case_Insensitive");
            Assert (not Equal (Right, Left), "Equal_Case_Insensitive");

            Assert (not Less (Left, Right),  "Less_Case_Insensitive");
            Assert (Less (Right, Left),      "Less_Case_Insensitive");
      end case;
   end Check;

   procedure Empty ("", '=', "");
   procedure Same_Case_Equal ("om3ahCae", '=', "om3ahCae");
   procedure Case_Equal ("om3ahCaE", '=', "om3ahCae");
   procedure Same_Case_Less  ("AAAAA", '<', "AABAA");
   procedure Case_Less_Upper ("AAAAA", '<', "aabaa");
   procedure Case_Less_Lower ("aaaaa", '<', "AABAA");
   procedure Same_Case_Greater  ("AACAA", '>', "AABAA");
   procedure Case_Greater_Upper ("AACAA", '>', "aabaa");
   procedure Case_Greater_Lower ("aacaa", '>', "AABAA");

   overriding
   procedure Initialize (T : in out Test) is
      use Ahven.Framework;
   begin
      T.Set_Name ("Fixed-length strings");

      Add_Test_Routine (T, Empty'Access,              "Empty");
      Add_Test_Routine (T, Same_Case_Equal'Access,    "Same_Case_Equal");
      Add_Test_Routine (T, Case_Equal'Access,         "Case_Equal");
      Add_Test_Routine (T, Same_Case_Less'Access,     "Same_Case_Less");
      Add_Test_Routine (T, Case_Less_Upper'Access,    "Case_Less_Upper");
      Add_Test_Routine (T, Case_Less_Lower'Access,    "Case_Less_Lower");
      Add_Test_Routine (T, Same_Case_Greater'Access,  "Same_Case_Greater");
      Add_Test_Routine (T, Case_Greater_Upper'Access, "Case_Greater_Upper");
      Add_Test_Routine (T, Case_Greater_Lower'Access, "Case_Greater_Lower");
   end Initialize;
end Unit_Tests.Fixed_Strings;
