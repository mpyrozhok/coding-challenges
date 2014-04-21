module Main
    where

import Data.List.Split (splitOn)
import Data.List (sort, intercalate)

main =
    getContents >>= putStr . unlines . process . lines
    where
        process = map (intercalate "," . map show . path . sort . numbers)

        numbers :: String -> [Int]
        numbers = takeSecond . map (splitOn ",") . init . splitOn ";"
        takeSecond xs = [read y | [x, y] <- xs]

        path :: [Int] -> [Int]
        path xs@(x:t) = x:(map (\(n,n') -> n' - n) $ zip xs t)
