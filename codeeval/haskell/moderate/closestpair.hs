module Main
    where

import Numeric (showGFloat)

maxDistance = 10000

minDistance :: [[Int]] -> Double -> Double
minDistance [x] m = m
minDistance (n:ns) m = minDistance ns (min m minIter)
    where
        minIter = foldl (\x y -> min x $ distance n y) maxDistance ns 
        distance :: [Int] -> [Int] -> Double
        distance f s = let [x, y] = f; [x', y'] = s in sqrt $ fromIntegral ((x - x') ^ 2 + (y - y') ^ 2)

getMinDistances :: [[Int]] -> [Double]
getMinDistances = reverse . getMinDistanceLoop []
    where
    getMinDistanceLoop ms (x:xs) = if pointCount > 0 then getMinDistanceLoop (minOfOneSet:ms) rest else ms
        where
            pointCount = head x
            minOfOneSet = minDistance (take pointCount xs) maxDistance
            rest = drop pointCount xs
    

main = getContents >>= putStr . unlines . process . lines
    where
        process = map minValueToStr . getMinDistances . map (map read . words)
        minValueToStr v = if v < maxDistance then showGFloat (Just 4) v "" else "INFINITY"
