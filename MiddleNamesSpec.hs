module MiddleNamesSpec where

import Test.Hspec

import MiddleNames

familyTree = Person "Midas"
               (Person "Ryan" (Person "Kerry" Unknown Unknown) (Person "Joan" Unknown Unknown))
               (Person "Andrea" (Person "David" Unknown Unknown) (Person "Christine" Unknown Unknown))

otherFamilyTree = Person "Alan"
               (Person "Paul" (Person "Daniel" Unknown Unknown) (Person "Carol" Unknown Unknown))
               (Person "Fang" (Person "Waiguo" Unknown Unknown) (Person "Waipo" Unknown Unknown))

main :: IO ()
main = hspec (do
  describe "middleNames" (do
    it "the first boy should be Kerry" (do
       putStrLn (show (middleNames Boy familyTree))
       head (middleNames Boy familyTree) `shouldBe` "Kerry")
    it "the second boy should be David" (do
       head (tail (middleNames Boy familyTree)) `shouldBe` "David")
    it "the first boy should be Daniel" (do
       head (middleNames Boy otherFamilyTree) `shouldBe` "Daniel")
    it "the first girl should be Christine" (do
       head (middleNames Girl familyTree) `shouldBe` "Christine")
    it "the first girl should be Waipo" (do
       head (middleNames Girl otherFamilyTree) `shouldBe` "Waipo")))
