module MiddleNamesSpec where

import Data.Tree
import Test.Hspec

import MiddleNames

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

main :: IO ()
main = hspec (do
  describe "middleNames" (do
    it "the first boy should be Kerry" (do
       head (middleNames Boy familyTree) `shouldBe` "Kerry")
    it "the second boy should be David" (do
       head (tail (middleNames Boy familyTree)) `shouldBe` "David")
    it "the first girl should be Christine" (do
       head (middleNames Girl familyTree) `shouldBe` "Christine")
    it "the second girl should be Joan" (do
       head (tail (middleNames Girl familyTree)) `shouldBe` "Joan")))
