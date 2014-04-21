module Main
    where

import Data.List.Split (splitOn)
import Data.Maybe (catMaybes)
import Data.List (elemIndices)

main = do
    content <- getContents
    let numbers = map ((\(xs:x:[]) -> let r = elemIndices (head x) xs in if null r then -1 else last r) . (splitOn ",")) . lines $ content
    mapM_ print numbers
