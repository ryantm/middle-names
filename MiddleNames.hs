module MiddleNames where

import Data.Tree

data Sex = Boy | Girl

type Name = String

type FamilyTree = Tree Name

name :: FamilyTree -> Name
name = rootLabel

reverseSnd :: ([a],[b]) -> ([a],[b])
reverseSnd (as,bs) = (as,reverse bs)

split :: [a] -> ([a], [a])
split [] = ([],[])
split (x:y:xs) = ([x] ++ fst (split xs), [y] ++ snd (split xs))

ancestors ft = fmap reverseSnd (fmap split (drop 2 (levels ft)))

middleNames Boy ft = fst (mconcat (ancestors ft))
middleNames Girl ft = snd (mconcat (ancestors ft))
