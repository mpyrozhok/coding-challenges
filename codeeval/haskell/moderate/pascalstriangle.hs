module Main
    where

-- |
-- >>> pascalsTriangle 6
-- "1 1 1 1 2 1 1 3 3 1 1 4 6 4 1 1 5 10 10 5 1"
pascalsTriangle :: Int -> String
pascalsTriangle n = triangleRow (n - 1) [1] [1]
    where
        triangleRow 0 _ res = unwords (map show res)
        triangleRow level prevRow res = triangleRow (level - 1) currentRow (res ++ currentRow)
            where
                currentRow :: [Int]
                currentRow = 1:zipWith (+) prevRow (drop 1 prevRow) ++ [1]

main = getContents >>= putStr . unlines . process . lines
    where
        process = map (pascalsTriangle . read)
