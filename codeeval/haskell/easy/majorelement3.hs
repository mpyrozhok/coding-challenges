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

getInts :: String -> [Int]
getInts xs = recurse xs []
    where
        recurse [] xs' = xs'
        recurse xs xs' = recurse (drop 1 $ (dropWhile (/=',') xs)) $ (parseNum (takeWhile (/=',') xs)):xs'

main = do
    getContents >>= putStr . unlines .  map (process . getInts) . lines
    where
        process xs
            | (length major) * 2 > length xs = show (head major)
            | otherwise = "None"
            where
                major = maximumBy (comparing length) . group . sort $ xs
