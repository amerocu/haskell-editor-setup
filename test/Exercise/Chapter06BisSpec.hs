module Exercise.Chapter06BisSpec where

import SpecHelper
import Exercise.Chapter06Bis

spec :: Spec
spec = do
    describe "reverse'" $ do
        context "with [1,2,3]" $
            it "should be [3,2,1]" $
                reverse' [1,2,3] `shouldBe` ([3,2,1] ::  [Int])
        context "with [1]" $
            it "should be [1]" $
                reverse' [1] `shouldBe` ([1] ::  [Int])
        context "with []" $
            it "should be []" $
                reverse' ([] ::  [Int]) `shouldBe` []

    describe "fact'" $ do
        context "with 1" $
            it "should be [3,2,1]" $
                fact' 1 `shouldBe` 1
        context "with 5" $
            it "should be 120" $
                fact' 5 `shouldBe` 120
        context "with 0" $
            it "should be 0" $
                fact' 0 `shouldBe` 1

    describe "insertAt" $ do
        context "with 1 3 [2,3,4,5]" $
            it "should be [2,3,4,1,5]" $
                insertAt 1 3 [2,3,4,5] `shouldBe` ([2,3,4,1,5]:: [Int])

    describe "oddList" $ do
        context "with [2,3,4,5]" $
            it "should be [3,5]" $
                oddList [2,3,4,5] `shouldBe` ([3,5]:: [Int])
        context "with []" $
            it "should be []" $
                oddList [] `shouldBe` ([] :: [Int])

    describe "mapOdd" $ do
        context "with (*2) [2,3,4,5]" $
            it "should be [2,6,4,10]" $
                mapOdd (*2) [2,3,4,5] `shouldBe` ([2,6,4,10]:: [Int])
        context "with (*2) [2,3,4]" $
            it "should be [2,6,4]" $
                mapOdd (*2) [2,3,4] `shouldBe` ([2,6,4]:: [Int])
                


main :: IO ()
main = hspec spec