module Main
    where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Data.Char (isDigit, isAlpha)

main = do
    content <- getContents
    mapM_ putStrLn $ map (separate . splitOn ",") . lines $ content
    where
        filterNumbers :: [String] -> [String]
        filterNumbers = filter (isDigit . head)
        filterWords = filter (isAlpha . head)
        separate :: [String] -> String
        separate x
            | null $ filterWords x = intercomma . filterNumbers $ x
            | null $ filterNumbers x = intercomma . filterWords $ x
            | otherwise = (intercomma . filterWords) x ++ '|': (intercomma . filterNumbers) x
            where
                intercomma = intercalate ","

