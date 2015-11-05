module MiddleNamesSpec where

import Test.Hspec

import Data.Tree

import MiddleNames


familyTree = Node "Midas"
             [Node "Ryan"
              [Node "Kerry" [Node "Robert" [], Node "Claudine" []],
               Node "Joan" [Node "Thomas" [], Node "Julia" []]],
              Node "Andrea"
              [Node "David" [Node "Carl" [], Node "Selma" []],
               Node "Christine" [Node "John" [], Node "Anastasia" []]]]

otherFamilyTree = Node "Alan"
                  [Node "Paul"
                   [Node "Daniel" [],
                    Node "Carol" []],
                   Node "Fang"
                   [Node "Waiguo" [],
                    Node "Waipo" []]]

main = hspec (do
  describe "middleNames" (do
    it "should return expected names for boys" (do
      middleNames Boy familyTree `shouldBe`
        ["Kerry", "David", "Robert", "Thomas", "Carl", "John"])
    it "should return expected names for girls" (do
      middleNames Girl familyTree `shouldBe`
        ["Christine", "Joan", "Anastasia", "Selma", "Julia", "Claudine"])
    it "should return Daniel second for boys" (do
      middleNames Boy otherFamilyTree !! 0 `shouldBe` "Daniel")
                         ))
