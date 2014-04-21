module Main
    where

import Data.List.Split (splitOn)
import qualified Data.IntMap as IM

main = do
    getContents >>= putStr . unlines . process . lines
    where
        process :: [String] -> [String]
        process = map (map (edgeLetters) . splitOn ',')
        edgeLetters :: [String] -> [(Int, Int)]
        edgeLetters xs = (ord . head $ xs, ord . last $ xs)
            occurenceCount = fromListWith (\(s, e) -> 
