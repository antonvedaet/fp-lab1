module Task13Spec (
    testTask13Recursively,
    testTask13Tail,
    testTask13Lazy,
    testTask13RecursiveAlt,
    testTask13RecursivelyGenerated,
) where

import Task13
import Test.HUnit

testTask13Recursively :: Test
testTask13Recursively = TestCase (assertEqual "Expected task13 to return 5537376230" 5537376230 (takeFirst10Digits $ task13Recursively task13Numbers))

testTask13Tail :: Test
testTask13Tail = TestCase (assertEqual "Expected task13 to return 5537376230" 5537376230 (takeFirst10Digits $ task13Tail task13Numbers))

testTask13Lazy :: Test
testTask13Lazy = TestCase (assertEqual "Expected task13 to return 5537376230" 5537376230 (takeFirst10Digits $ task13Lazy task13Numbers))

testTask13RecursiveAlt :: Test
testTask13RecursiveAlt = TestCase (assertEqual "Expected task13 to return 5537376230" 5537376230 (takeFirst10Digits $ task13RecursiveAlt task13Numbers))

testTask13RecursivelyGenerated :: Test
testTask13RecursivelyGenerated = TestCase (assertEqual "Expected task13 to return 1107475246" 1107475246 (takeFirst10Digits $ task13Recursively task13NumbersDoubled))