module Main
    where

import Data.IntSet (IntSet, insert, member, empty)
import Data.Char (digitToInt)

isHappy :: Int -> IntSet -> Bool
isHappy 1 _ = True
isHappy x b = if member x b then False else isHappy square (insert x b) 
    where 
        square = (sum . map ((^2) . digitToInt) . show) x  

main = do
    content <- getContents
    let numbers = (map (read :: String -> Int) . lines) content
    mapM_ print $ map (\x -> if isHappy x empty then 1 else 0) numbers
