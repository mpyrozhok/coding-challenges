module Main
    where

import Data.List.Split (splitOn)
import Data.Maybe (listToMaybe)
import Data.List (sortBy)

orthVector :: (Int, Int) -> (Int, Int)
orthVector (x, y) = (-y, x)

addVector :: (Int, Int) -> (Int, Int) -> (Int, Int)
addVector (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

vectorize :: [Int] -> [(Int, Int)] 
vectorize [x1, y1, x2, y2, x3, y3, x4, y4] = sortVectors vs
    where
        sortVectors = sortBy (\(v1, v2) (v3, v4) -> compare (abs v1 + abs v2) (abs v3 + abs v4))
        vs = [(x1 - x2, y1 - y2),  (x1 - x3, y1 - y3), (x1 - x4, y1 - y4)]

isSquare :: [(Int, Int)] -> Bool
isSquare [x, y, d@(hx, hy)] = addVector x y == d && (orthVector x == y || orthVector y == x) && abs hx + abs hy > 0

main = do
    content <- getContents
    mapM_ (putStrLn . res . isSquare . vectors) (lines content)
    where
        vectors = vectorize . map read . splitOn "," . filter (`notElem` " ()")
        res True = "true"
        res False = "false"
