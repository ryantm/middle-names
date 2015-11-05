module MiddleNames where

import Data.Tree
import Debug.Trace

data Sex = Boy | Girl

type Name = String

type FamilyTree = Tree Name

everyOther :: [a] -> [a]
everyOther (x:y:xs) = [x] ++ everyOther xs
everyOther [x] = [x]
everyOther [] = []

girlEveryOther l = everyOther (drop 1 l)

everyOtherSplit :: [a] -> ([a],[a])
everyOtherSplit (x:y:xs) = ([x] ++ fst (everyOtherSplit xs),
                            [y] ++ snd (everyOtherSplit xs))
everyOtherSplit [x] = ([x],[])
everyOtherSplit [] = ([],[])

reverseSnd :: ([a],[b]) ->  ([a],[b])
reverseSnd (as,bs) = (as, reverse bs)


allMiddleNames :: FamilyTree -> ([Name],[Name])
allMiddleNames =
  mconcat .
  reverseGirls .
  splitByGender .
  grandparentsAndOlder .
  sortByOldness
  where
    sortByOldness = levels
    grandparentsAndOlder = drop 2
    splitByGender = fmap everyOtherSplit
    reverseGirls = fmap reverseSnd

middleNames :: Sex -> FamilyTree -> [Name]
middleNames Boy familyTree = fst (allMiddleNames familyTree)
middleNames Girl familyTree = snd (allMiddleNames familyTree)
