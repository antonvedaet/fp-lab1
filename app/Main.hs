module Main (main) where

import Lib (takeFirst10Digits, task13Numbers, task13Recursively)

main :: IO ()
main = print $ takeFirst10Digits $ task13Recursively task13Numbers
