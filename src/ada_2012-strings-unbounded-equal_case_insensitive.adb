with Ada.Characters.Handling;

function Ada_2012.Strings.Unbounded.Equal_Case_Insensitive
  (Left, Right : Ada.Strings.Unbounded.Unbounded_String)
  return Boolean is
   use Ada.Characters.Handling, Ada.Strings.Unbounded;
begin
   return To_Lower (To_String (Left)) = To_Lower (To_String (Right));
end Ada_2012.Strings.Unbounded.Equal_Case_Insensitive;
