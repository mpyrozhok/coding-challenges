module Main
    where

-- |
-- >>> direction [0, 0, 0, 1]
-- "N"
-- >>> direction [0, 0, 1, 1]
-- "NE"
-- >>> direction [0, 0, 1, 0]
-- "E"
-- >>> direction [0, 0, 1, -1]
-- "SE"
-- >>> direction [0, 0, 0, -1]
-- "S"
-- >>> direction [0, 0, -1, -1]
-- "SW"
-- >>> direction [0, 0, -1, 0]
-- "W"
-- >>> direction [0, 0, -1, 1]
-- "NW"
-- >>> direction [0, 0, 0, 0]
-- "here"
direction [o, p, q, r] 
    | o == q && p == r = "here"
    | o == q && p < r = "N"
    | o < q && p < r  = "NE"
    | o < q && p == r = "E"
    | o < q && p > r = "SE"
    | o == q && p > r = "S"
    | o > q && p > r = "SW"
    | o > q && p == r = "W"
    | o > q && p < r = "NW"

main = do
    getContents >>= putStr . unlines . map (process . map read . words) . lines
    where
        process :: [Int] -> String
        process = direction
