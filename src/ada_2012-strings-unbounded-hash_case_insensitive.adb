with Ada.Characters.Handling,
     Ada.Strings.Hash;

function Ada_2012.Strings.Unbounded.Hash_Case_Insensitive
  (Key : in Ada.Strings.Unbounded.Unbounded_String)
  return Ada.Containers.Hash_Type is
   use Ada.Characters.Handling, Ada.Strings.Unbounded;
begin
   return Ada.Strings.Hash (To_Lower (To_String (Key)));
end Ada_2012.Strings.Unbounded.Hash_Case_Insensitive;
