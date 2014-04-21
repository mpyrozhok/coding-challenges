module Main
    where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Data.Bits (shiftL,(.&.))

getGreaterMultiple :: Integer -> Integer -> Integer
getGreaterMultiple x n = head $ dropWhile (<x) $ map (*n) [0..]

main = do
    content <- getContents
    let numbers =  map (map (read :: String -> Integer)) $ map (splitOn ",") . lines $ content
    mapM_ print [m | x:n:[] <- numbers, let m = getGreaterMultiple x n]
