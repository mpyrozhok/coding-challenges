module Main
    where

import Data.List.Split (splitOn)


-- |
-- >>> countTiles [0,1,3,4,6] [0,1,2,4]
-- 5
-- >>> countTiles [0,1,2,4] [0,1,3,4,5]
-- 6
-- >>> countTiles [0,2,4,8,10,13,14,18,22,23,24,33,40,42,44,47,49,53,55,63,66,81,87,91] [0,147,220]
-- 24
countTiles :: [Double] -> [Double] -> Int
countTiles xs ys = countTiles' xs ys (tangent (last xs) (last ys)) 0 
    where
        tangent :: Fractional a => a -> a -> a
        tangent x y = x / y
        countTiles' [] _ _ c = c
        countTiles' _ [] _ c = c
        countTiles' (x:xs') (y:ys') t c
            | tg < t = countTiles' xs' (y:ys') t (c + 1)
            | tg > t = countTiles' (x:xs') ys' t (c + 1)
            | tg == t = countTiles' xs' ys' t (c + 1)
            | otherwise = countTiles' xs' ys' t c
            where
                tg = tangent x y

-- |
-- >>> extractNumbers "(1,2) (1,3)"
-- [[1.0,2.0],[1.0,3.0]]
extractNumbers :: String -> [[Double]]
extractNumbers ns = map (map read . splitOn "," . noBrackets) . words $ ns
    where
        noBrackets = filter (`notElem` "()")

main = getContents >>= putStr . unlines . map (show . uncurry countTiles . toParams . extractNumbers) . lines
    where
        toParams [xs, ys] = (xs, ys)
