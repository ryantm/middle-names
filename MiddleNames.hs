module MiddleNames where

import Data.Tree

data Sex = Boy | Girl

type Name = String

type FamilyTree = Tree Name

name :: FamilyTree -> Name
name = rootLabel


familyTree =
  Node "Midas"
   [Node "Ryan"
    [Node "Kerry"
     [Node "Grandpa Mulligan" [],
      Node "Claudine" []],
     Node "Joan"
     [Node "Grandpa Egan" [],
      Node "Julia" []]],
    Node "Andrea"
    [Node "David"
     [Node "Carl" [],
      Node "Selma" []],
     Node "Christine"
     [Node "Grandpa Christine" [],
      Node "Nelly" []]]]





-- data Choice = A | B deriving Show


-- subtraction :: Int -> Int
-- subtraction i = recur 1
--   where recur index =
--           if i < (2 ^ index) then
--              (2 ^ (index -1))
--           else
--             recur (index+1)

-- aB = recurAB 1
--   where recurAB index = replicate index A ++
--                             replicate index B ++
--                             recurAB (index*2)

-- kernel = [ [A, A], [B, A]]

-- getters :: [[Choice]]
-- getters = kernel ++ map getter [2..]
--   where
--     getter index = (aB !! index) : (previous index)
--     previous index = getters !! (index - subtraction index)



-- -- boyNameGetters :: [FamilyTree -> Name]
-- -- boyNameGetters = map (\ getter -> name . getter) boyGetters

-- -- dads :: FamilyTree -> [Name]
-- -- dads ft = map (\ getter -> getter ft) boyNameGetters



-- -- momDad = recurMomDad 1
-- --   where recurMomDad index = replicate index mom ++
-- --                             replicate index dad ++
-- --                             recurMomDad (index+1)

-- -- girlKernel = [mom . mom, mom . dad]

-- -- girlGetters :: [FamilyTree -> FamilyTree]
-- -- girlGetters = girlKernel ++ map girlGetter [2..]
-- --   where
-- --     girlGetter index = (momDad !! index) . (previous index)
-- --     previous index = trace (show (index - nextSquare index)) (girlGetters !! (index - nextSquare index))

-- -- girlNameGetters :: [FamilyTree -> Name]
-- -- girlNameGetters = map (\ getter -> name . getter) girlGetters

-- -- moms :: FamilyTree -> [Name]
-- -- moms ft = map (\ getter -> getter ft) girlNameGetters

-- -- middleNames :: Sex -> FamilyTree -> [Name]
-- -- middleNames Boy ft = dads ft
-- -- middleNames Girl ft = moms ft
