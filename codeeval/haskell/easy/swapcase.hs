module Main
    where

import Data.Char (isLower, isUpper, toUpper, toLower)
import Data.List (intercalate)

switchCase x | isLower x = toUpper x 
             | otherwise = toLower x

main = do
    content <- getContents
    let l = map (map switchCase) . lines $ content
    mapM_ putStrLn l
