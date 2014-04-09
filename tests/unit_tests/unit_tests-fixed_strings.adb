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
      function Equal (Left, Right : in String) return Boolean
        renames Ada_2012.Strings.Equal_Case_Insensitive;
      function Less  (Left, Right : in String) return Boolean
        renames Ada_2012.Strings.Less_Case_Insensitive;
      use Ahven;
   begin
      pragma Style_Checks (Off); --  Tabular layout
      case Comparison is
         when '<' =>
            Assert (not Equal (Left => Left,  Right => Right), "Equal_Case_Insensitive");
            Assert (not Equal (Left => Right, Right => Left),  "Equal_Case_Insensitive");

            Assert (    Less  (Left => Left,  Right => Right), "Less_Case_Insensitive");
            Assert (not Less  (Left => Right, Right => Left),  "Less_Case_Insensitive");
         when '=' =>
            Assert (    Equal (Left => Left,  Right => Right), "Equal_Case_Insensitive");
            Assert (    Equal (Left => Right, Right => Left),  "Equal_Case_Insensitive");

            Assert (not Less  (Left => Left,  Right => Right), "Less_Case_Insensitive");
            Assert (not Less  (Left => Right, Right => Left),  "Less_Case_Insensitive");
         when '>' =>
            Assert (not Equal (Left => Left,  Right => Right), "Equal_Case_Insensitive");
            Assert (not Equal (Left => Right, Right => Left),  "Equal_Case_Insensitive");

            Assert (not Less  (Left => Left,  Right => Right), "Less_Case_Insensitive");
            Assert (    Less  (Left => Right, Right => Left),  "Less_Case_Insensitive");
      end case;
      pragma Style_Checks (On);
   end Check;

   procedure Empty              is new Check ("", '=', "");
   procedure Same_Case_Equal    is new Check ("om3ahCae", '=', "om3ahCae");
   procedure Case_Equal         is new Check ("om3ahCaE", '=', "om3ahCae");
   procedure Same_Case_Less     is new Check ("AAAAA", '<', "AABAA");
   procedure Case_Less_Upper    is new Check ("AAAAA", '<', "aabaa");
   procedure Case_Less_Lower    is new Check ("aaaaa", '<', "AABAA");
   procedure Same_Case_Greater  is new Check ("AACAA", '>', "AABAA");
   procedure Case_Greater_Upper is new Check ("AACAA", '>', "aabaa");
   procedure Case_Greater_Lower is new Check ("aacaa", '>', "AABAA");

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
