with Ada.Characters.Handling;

function Ada_2012.Strings.Less_Case_Insensitive (Left, Right : String)
  return Boolean is
   use Ada.Characters.Handling;
begin
   return To_Lower (Left) < To_Lower (Right);
end Ada_2012.Strings.Less_Case_Insensitive;
