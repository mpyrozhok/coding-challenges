module Main
    where

import Data.List.Split (splitOn)
import Data.List (elemIndices)

pairToTuple :: [String] -> Maybe (String, String)
pairToTuple [] = Nothing
pairToTuple (x:xs) = Just (x, head xs)

checkIfRotated :: Maybe (String, String) -> Bool
checkIfRotated Nothing = False
checkIfRotated (Just (tgt, src)) = elem tgt $ map candidate findStarts
   where
        findStarts :: [Int]
        findStarts = elemIndices start src
        candidate x = let (h, t) = splitAt x src in t ++ h
        start = head tgt

main = getContents >>= putStr . unlines . process . lines
    where
        process = map (show . checkIfRotated . pairToTuple . splitOn ",")
