module Task18 (
    task18RecursionBrute,
    task18RecursionTailBrute,
    task18MemoizationInfiniteLists,
) where

task18Triangle :: [[Int]]
task18Triangle =
    [ [75]
    , [95, 64]
    , [17, 47, 82]
    , [18, 35, 87, 10]
    , [20, 4, 82, 47, 65]
    , [19, 1, 23, 75, 3, 34]
    , [88, 2, 77, 73, 7, 63, 67]
    , [99, 65, 4, 28, 6, 16, 70, 92]
    , [41, 41, 26, 56, 83, 40, 80, 70, 33]
    , [41, 48, 72, 33, 47, 32, 37, 16, 94, 29]
    , [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14]
    , [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57]
    , [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48]
    , [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31]
    , [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
    ]

task18RecursionBrute :: Int -> Int -> Int
task18RecursionBrute x y =
    (task18Triangle !! x !! y)
        + ( if x + 1 < length task18Triangle
                then max (task18RecursionBrute (x + 1) y) (task18RecursionBrute (x + 1) (y + 1))
                else 0
          )

task18RecursionTailBrute :: Int
task18RecursionTailBrute = go 0 0 0
  where
    go i j acc
        | i >= length task18Triangle = acc
        | j < length (task18Triangle !! i) =
            let currVal = task18Triangle !! i !! j
                l = go (i + 1) j (acc + currVal)
                r = go (i + 1) (j + 1) (acc + currVal)
             in max l r
        | otherwise = acc

task18MemoizationInfiniteLists :: Int -> Int -> Int
task18MemoizationInfiniteLists x y =
    (task18Triangle !! x !! y)
        + ( if x + 1 < length task18Triangle
                then max ([[task18MemoizationInfiniteLists xx yy | yy <- [0 ..]] | xx <- [0 ..]] !! (x + 1) !! y) ([[task18MemoizationInfiniteLists xx yy | yy <- [0 ..]] | xx <- [0 ..]] !! (x + 1) !! (y + 1))
                else 0
          )
