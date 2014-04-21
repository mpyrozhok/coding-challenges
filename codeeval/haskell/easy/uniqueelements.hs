module Main
    where

import Data.List.Split (splitOn)
import Data.List (intercalate, nub)


main = do
    content <- getContents
    let numbers = map (nub . map (read :: String -> Int) . splitOn ",") . lines $ content
    mapM_ putStrLn $ map (intercalate "," . map show) numbers
