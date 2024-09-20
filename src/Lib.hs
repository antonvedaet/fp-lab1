module Lib (
    task13,
) where

task13 :: [Integer] -> [Char]
task13 nums = take 10 $ show $ sum nums
