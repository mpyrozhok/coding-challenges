module Main
    where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Data.Char (isDigit, isAlpha)

main = do
    content <- getContents
    mapM_ putStrLn $ map (splice . separate . splitOn ",") . lines $ content
    where
        separate = foldl sep ([], [])
            where
                sep (w, n) x = if isDigit $ head x then (w, x:n) else (x:w, n)

        splice :: ([String], [String]) -> String
        splice ([], n) = intercomma n
        splice (w, []) = intercomma w
        splice (w, n) = intercomma w ++ '|': intercomma n
        intercomma = intercalate "," . reverse

