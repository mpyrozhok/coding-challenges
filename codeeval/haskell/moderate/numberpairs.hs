module Main
    where

import Data.List.Split (splitOn)
import Data.List (intercalate)

getInput :: String -> ([Int], Int)
getInput xs = (nums, x)
    where
        [strNums, strX] = splitOn ";" xs
        nums = map read . splitOn "," $ strNums
        x = read strX

-- |
-- >>> pairs ([1,2,3,4,6], 5)
-- "1,4;2,3"
pairs :: ([Int], Int) -> String
pairs (xs, s) 
    | null strPairs = "NULL"
    | otherwise = intercalate ";" strPairs
    where
        strPairs = findPair xs []
        findPair [_] ps = ps
        findPair (n:ns) ps = findPair ns (ps ++ [show n ++ "," ++ show e | e <- ns, n + e == s])


main = getContents >>= putStr . unlines . process . lines
    where
        process = map (pairs . getInput)
