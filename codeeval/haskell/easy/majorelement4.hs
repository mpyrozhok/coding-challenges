module Main
    where

import Data.List.Split (splitOn)
import Data.List (maximumBy, sort, group)
import Data.Ord (comparing)
import Data.Char (digitToInt)

showMaybe :: Maybe Int -> String
showMaybe (Just k) = show k
showMaybe Nothing = "None"

splitLine = splitOn ","
--readNums = map (fst . head . reads )
parseNum :: String -> Int
parseNum xs = sum [(digitToInt x) * m | (x, m) <- zip (reverse xs) (iterate (*10) 1)]
readNums = map (parseNum)

--getInts :: String -> [Int]
--getInts xs = rec (reverse xs) [] 0 1
--    where
--        rec [] xs' curNum  _ = curNum:xs'
--        rec (x:xs) xs' curNum m
--            | x == ',' = rec xs (curNum:xs') 0 1
--            | otherwise = rec xs xs' (curNum + m * (digitToInt x)) (m * 10)

-- |
-- >>> getInts "123,34"
-- [123,34]
getInts :: String -> [Int]
getInts xs = rec   
    where
        (rec, _, _) = foldr iter ([], 0, 1) ('[':xs)
        iter x (xs', n, m)
            | x == ',' = (n:xs', 0, 1)
            | x == '[' = (n:xs', 0, 1)
            | otherwise = (xs', n + (digitToInt x) * m, m * 10)

main = do
    getContents >>= putStr . unlines .  map (process . getInts) . lines
    where
        process xs
            | (length major) * 2 > length xs = show (head major)
            | otherwise = "None"
            where
                major = maximumBy (comparing length) . group . sort $ xs
