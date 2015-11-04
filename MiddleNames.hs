module MiddleNames where


data Sex = Boy | Girl

type Name = String

-- Person Name Father Mother
data FamilyTree = Unknown | Person Name FamilyTree FamilyTree


name :: FamilyTree -> Name
name (Person n _ _) = n
name Unknown = "Unknown"

dad :: FamilyTree -> FamilyTree
dad (Person _ dad _) = dad
dad Unknown = Unknown

mom :: FamilyTree -> FamilyTree
mom (Person _ _ mom) = mom
mom Unknown = Unknown


-- Dad Dad
-- Mom Dad
-- Dad Dad Dad
-- Dad Mom Dad
-- Mom Dad Dad
-- Mom Mom Dad

dadMom = recurDadMom 1
  where recurDadMom index = replicate index dad ++
                            replicate index mom ++
                            recurDadMom (index+1)

nextSquare :: Int -> Int
nextSquare i = recurNextSquare 1
  where recurNextSquare index =
          if i < (2 ^ index) then
             index
          else
            recurNextSquare (index+1)

boyKernel = [dad . dad, dad . mom]

boyGetters :: [FamilyTree -> FamilyTree]
boyGetters = boyKernel ++ map boyGetter [2..]
  where
    boyGetter index = (dadMom !! index) . (previous index)
    previous index = boyGetters !! (index - nextSquare index)

-- boyGetters :: [FamilyTree -> FamilyTree]
-- boyGetters = [dad . dad, dad . mom, dad . dad . dad]

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
