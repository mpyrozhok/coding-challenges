module Main
    where

import Data.List.Split (splitOn)
import Data.List (intercalate)

-- |
-- >>> reverseByK [1,2,3,4,5] 2
-- [2,1,4,3,5]
-- >>> reverseByK [1,2,3,4,5] 3
-- [3,2,1,4,5]
reverseByK :: [Int] -> Int -> [Int]
reverseByK xs k = rev xs []
    where
        rev remainder result = let group = take k remainder in if (length group) < k then result ++ remainder else rev (drop k remainder) (result ++ (reverse group))

split :: String -> ([Int], Int)
split xs = (map read (splitOn "," nums), read k)
    where
        [nums, k] = splitOn ";" xs

main = do
    getContents >>= putStr . unlines . process . lines
    where
        process = map (intercalate "," . map show . uncurry reverseByK . split)
