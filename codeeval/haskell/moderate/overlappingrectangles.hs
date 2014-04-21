module Main
    where

import Data.List.Split (splitOn)

doRectanglesOverlap :: [Int] -> Bool
doRectanglesOverlap d = not (ax1 > bx2 || ay1 < by2 || ax2 < bx1 || ay2 > by1) 
    where
        [ax1, ay1, ax2, ay2, bx1, by1, bx2, by2] = d

main = do
    putStr . unlines . map process . lines =<< getContents
    where
        process = show . doRectanglesOverlap . map read . splitOn ","
