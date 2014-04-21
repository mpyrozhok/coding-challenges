module Main
    where

import Data.List.Split (splitOn)
import Data.List (findIndices)

pairToTuple :: [String] -> Maybe (String, String)
pairToTuple [] = Nothing
pairToTuple (x:xs) = Just (x, head xs)

checkIfRotated :: Maybe (String, String) -> Bool
checkIfRotated Nothing = False
checkIfRotated (Just (tgt, src)) = any (==tgt) $ map candidate findStarts
   where
        findStarts :: [Int]
        findStarts = findIndices (==start) src
        candidate x = let (h, t) = splitAt x src in t ++ h
        start = head tgt

main = do
    getContents >>= putStr . unlines . process . lines
    where
        process = map (show . checkIfRotated . pairToTuple . splitOn ",")
