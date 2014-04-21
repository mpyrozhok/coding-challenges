module Main
    where

import Data.List (maximumBy)

main = do
    content <- getContents
    mapM_ putStrLn $ map (foldr (\x y -> if (length y) > (length x) then y else x) "" . words) . lines $ content
