module Main
    where

-- |
-- >>> getMaximumPath [[5], [9, 6], [4, 6, 8], [0, 7, 1, 5]]
-- 27
getMaximumPath :: [[Int]] -> Int
getMaximumPath xs = head $ foldr1 (\x y -> zipWith (uncurry (+)) x (getMaxElements y)) xs
    where
        getMaxElements :: [Int] -> [Int]
        getMaxElements ns = zipWith (uncurry max) ns (tail ns)

main = getContents >>= putStr . process . lines
    where
        process = show . getMaximumPath .  map (map read . words)
