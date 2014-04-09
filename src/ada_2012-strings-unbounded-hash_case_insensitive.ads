with Ada.Containers,
     Ada.Strings.Unbounded;

function Ada_2012.Strings.Unbounded.Hash_Case_Insensitive
  (Item : in Ada.Strings.Unbounded.Unbounded_String)
  return Ada.Containers.Hash_Type;
