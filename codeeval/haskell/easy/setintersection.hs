module Main
    where

import Data.List.Split (splitOn)
import Data.List (intercalate)
import Data.IntSet (toList, fromList, intersection)

main = do
    content <- getContents
    let numbers =  map (map (map (read :: String -> Int) . splitOn ",") . splitOn ";") $ lines content
    let interList (m:n:[]) = toList $ intersection (fromList m) (fromList n)
    mapM_ putStrLn $ map (intercalate "," . map show . interList) numbers
