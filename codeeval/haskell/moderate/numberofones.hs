module Main
    where

import Data.Bits (shiftR)

numberOfOnes :: Int -> Int
numberOfOnes = length . filter odd . takeWhile (>0) . iterate (`shiftR` 1) 

main = getContents >>= putStr . unlines . map (show . numberOfOnes . read) . lines
