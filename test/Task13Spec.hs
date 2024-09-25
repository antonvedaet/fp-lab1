module Task13Spec (
    testTask13Recursively,
    testTask13Tail,
) where

import Lib (
    takeFirst10Digits,
    task13Numbers,
    task13Recursively,
    task13Tail,
 )
import Test.HUnit

testTask13Recursively :: Test
testTask13Recursively = TestCase (assertEqual "Expected task13 to return 5537376230" 5537376230 (takeFirst10Digits $ task13Recursively task13Numbers))

testTask13Tail :: Test
testTask13Tail = TestCase (assertEqual "Expected task13 to return 5537376230" 5537376230 (takeFirst10Digits $ task13Tail task13Numbers))
