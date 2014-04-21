module Main
    where

import Data.List.Split (splitOn)

-- |
-- >>> getRepeatedNumber "5;0,1,2,3,0"
-- 0
-- >>> getRepeatedNumber "3;0,1,1"
-- 1
-- >>> getRepeatedNumber "20;0,1,10,3,2,4,5,7,6,8,11,9,15,12,13,4,16,18,17,14"
-- 4
getRepeatedNumber :: String -> Int
getRepeatedNumber l = (sum ((map read . splitOn ",") xs)) - s 
    where
        [n, xs] = splitOn ";" l
        m = (read n) - 2
        s = div ((1 + m) * m) 2

main = do
    getContents >>= putStr . unlines . process . lines
    where
        process = map(show . getRepeatedNumber)
