module Main
    where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Data.Bits (shiftL,(.&.))

-- |
-- >>> prepareLists "9 0 6 | 15 14 9\n5 | 8"
-- [[[9,0,6],[15,14,9]],[[5],[8]]]
prepareLists = map (map (map (read :: String -> Int) . words) . splitOn "|") . lines

main = do
    content <- getContents
    let numbers = prepareLists content
    mapM_ putStrLn $ map (intercalate " " . (map (show . (\(x, y) -> x * y)))) [zip x y | [x, y] <- numbers]
