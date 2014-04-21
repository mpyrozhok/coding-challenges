module Main
    where

import Data.List.Split (splitOn)

-- |
-- >>> combinations 4 [2,3,1,0,-4,-1]
-- [[1,2],[3,2],[1,3]]
combinations :: Int -> [Int] -> [[Int]]
combinations k xs = combinations' [] (reverse xs) ++ combinations' [] xs
    where
        l = (min (length xs) k) - 1
        combinations' :: [[Int]] -> [Int] -> [[Int]]
        combinations' cs [] = cs
        combinations' cs xs' = combinations' (cs ++ rowCombinations) (drop 1 xs')
            where
                rowCombinations :: [[Int]]
                rowCombinations = foldl (\x y -> (y:(pfx)):x) [] (drop l xs')
                pfx = take l xs'

main = do
    getContents >>= putStr . unlines . process . lines
    where
        process = map (show . length . filter (==0) . map sum . combinations 4 . map read . splitOn ",")
