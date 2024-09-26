module Task18Spec (
    testTask18RecursivelyBrute,
    testTask18RecursivelyTailBrute,
    testTask18Memoization,
) where

import Task18
import Test.HUnit

testTask18RecursivelyBrute :: Test
testTask18RecursivelyBrute = TestCase (assertEqual "Expected task18 to return 1074" 1074 (task18RecursionBrute 0 0))

testTask18RecursivelyTailBrute :: Test
testTask18RecursivelyTailBrute = TestCase (assertEqual "Expected task18 to return 1074" 1074 task18RecursionTailBrute)

testTask18Memoization :: Test
testTask18Memoization = TestCase (assertEqual "Expected task18 to return 1074" 1074 (task18MemoizationInfiniteLists 0 0))