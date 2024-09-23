import Test.HUnit
import Lib


testTask13 :: Test
testTask13 = TestCase (assertEqual "Expected task13 to return '5537376230'" "5537376230" (task13Solution))

main :: IO ()
main = do
    _ <- runTestTT $ TestList [testTask13]
    return ()