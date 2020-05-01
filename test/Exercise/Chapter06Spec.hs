module Exercise.Chapter06Spec where

import SpecHelper
import Control.Exception (evaluate)

spec :: Spec
spec = do
    describe "sumInts" $ do
        context "with 1 4" $
            it "should be 10" $
                (sumInts 1 4 )`shouldBe` 10
        context "with 1 1" $
            it "should be 1" $
                (sumInts 1 1 )`shouldBe` 1
        context "with 0 0" $
            it "should be 10" $
                (sumInts 0 0 )`shouldBe` 0

    describe "sq" $ do
        context "with 1" $
            it "should be 1" $
                (sq 1 )`shouldBe` 1
        context "with 4" $
            it "should be 2" $
                (sq 4 )`shouldBe` 2
        context "with 10" $
            it "should be 3" $
                (sq 10 )`shouldBe` 3

    describe "sumSquares" $ do
        context "with 1 3" $
            it "should be 3" $
                (sumSquares 1 3 )`shouldBe` 3
        context "with 4 8" $
            it "should be 10" $
                (sumSquares 4 8 )`shouldBe` 10
        context "with 10" $
            it "should be 2" $
                (sumSquares 1 2 )`shouldBe` 2


main :: IO ()
main = hspec spec