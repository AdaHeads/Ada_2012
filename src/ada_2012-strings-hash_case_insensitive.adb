with Ada.Characters.Handling,
     Ada.Strings.Hash;

function Ada_2012.Strings.Hash_Case_Insensitive (Item : in String)
  return Ada.Containers.Hash_Type is
   use Ada.Characters.Handling;
begin
   return Ada.Strings.Hash (To_Lower (Item));
end Ada_2012.Strings.Hash_Case_Insensitive;
