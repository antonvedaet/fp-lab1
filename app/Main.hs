module Main (main) where

import Task13

main :: IO ()
main = print $ takeFirst10Digits $ task13Recursively task13Numbers
