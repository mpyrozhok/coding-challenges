module Main
    where

import Data.Bits (shiftR)

numberOfOnes :: Int -> Int
numberOfOnes = length . filter (odd) . takeWhile (>0) . iterate (\x -> shiftR x 1) 

main = do
    getContents >>= putStr . unlines . map (show . numberOfOnes . read) . lines
