module Task13Spec (testTask13) where

import Lib
import Test.HUnit

testTask13 :: Test
testTask13 = TestCase (assertEqual "Expected task13 to return '5537376230'" "5537376230" task13Solution)
