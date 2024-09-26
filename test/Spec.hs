import Task13Spec
import Test.HUnit

main :: IO ()
main = do
    _ <- runTestTT $ TestList [testTask13Recursively, testTask13Tail, testTask13Lazy, testTask13RecursiveAlt]
    return ()