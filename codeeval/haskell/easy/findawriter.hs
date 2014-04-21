module Main
    where

import Data.List.Split (splitOn)

decrypt msg = generateText $ splitOn "|" msg
    where
        generateText [cypher,key] = [cypher !! (position - 1) | position <- (map (read::String->Int) . words) key]
        

main = do
    content <- getContents
    mapM_ putStrLn $ map decrypt . lines $ content 
