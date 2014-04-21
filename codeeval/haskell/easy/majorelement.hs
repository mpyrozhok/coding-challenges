module Main
    where

import Data.List.Split (splitOn)
import Data.List (maximumBy)
import Data.Array.Unboxed (accumArray, elems, assocs)
import Data.Array.Unboxed (UArray)
import Data.Ord (comparing)
import Data.Char (digitToInt)

showMaybe :: Maybe Int -> String
showMaybe (Just k) = show k
showMaybe Nothing = "None"

parseNum :: String -> Int
parseNum xs = sum [(digitToInt x) * m | (x, m) <- zip (reverse xs) (iterate (*10) 1)]
readNums = map (parseNum)

getInts :: String -> [Int]
getInts xs = rec   
    where
        (rec, _, _) = foldr iter ([], 0, 1) ('[':xs)
        iter x (xs', n, m)
            | x == ',' = (n:xs', 0, 1)
            | x == '[' = (n:xs', 0, 1)
            | otherwise = (xs', n + (digitToInt x) * m, m * 10)

getMajor :: [Int] -> Maybe Int
getMajor xs = if snd m > (l `div` 2) then Just (fst m) else Nothing
    where
        m = maximumBy (comparing snd) finArray 
        finArray = assocs array
        l = foldl (\a (_, x) -> x + a) 0 finArray 
        array :: UArray Int Int
        array = accumArray (+) 0 (0, 100) $ zip xs (repeat 1)

main = do
    getContents >>= putStr . unlines .  map (showMaybe . getMajor . getInts) . lines
