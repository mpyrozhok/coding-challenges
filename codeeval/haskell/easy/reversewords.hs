module Main
    where

import Data.List (intercalate)

main = do
    content <- getContents
    mapM_ putStrLn [intercalate " " $ reverse line | line <- map words . lines $ content]
