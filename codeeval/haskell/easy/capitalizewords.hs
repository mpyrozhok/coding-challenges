module Main
    where

import Data.Char (toUpper)
import Data.List (intercalate)

main = do
    content <- getContents
    let capitalizedWordsInLines = map (map (\(x:xs) -> (toUpper x):xs) . words) . lines $ content
    mapM_ putStrLn $ map (intercalate " ") capitalizedWordsInLines
