module MiddleNames where


data Sex = Boy | Girl

type Name = String

-- Person Name Father Mother
data FamilyTree = Unknown | Person Name FamilyTree FamilyTree


-- Dad Dad
-- Mom Dad
-- Dad Dad Dad
-- Dad Mom Dad
-- Mom Dad Dad
-- Mom Mom Dad

name :: FamilyTree -> Name
name (Person n _ _) = n
name Unknown = "Unknown"

dad :: FamilyTree -> FamilyTree
dad (Person _ dad _) = dad
dad Unknown = Unknown

mom :: FamilyTree -> FamilyTree
mom (Person _ _ mom) = mom
mom Unknown = Unknown

boyGetters :: [FamilyTree -> FamilyTree]
boyGetters = [dad . dad, dad . mom, dad . dad . dad]

boyNameGetters :: [FamilyTree -> Name]
boyNameGetters = map (\ getter -> name . getter) boyGetters

dads :: FamilyTree -> [Name]
dads ft = map (\ getter -> getter ft) boyNameGetters

moms :: FamilyTree -> [Name]
moms (Person _ _ mom) =
  case mom of
  Unknown -> []
  ft@(Person name _ mom) -> [name] ++ moms ft

middleNames :: Sex -> FamilyTree -> [Name]
middleNames Boy ft = dads ft
middleNames Girl ft = drop 1 (moms ft)
