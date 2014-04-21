module Main
    where

import Data.IntMap (fromListWith, toList, filter)
import Data.Maybe (listToMaybe, fromMaybe)
import qualified Data.List (filter)

-- | Finding lowest unique number position in the list
-- >>> lowestUniqueNumberPos [3,3,9,1,6,5,8,1,5,3]
-- 5
-- >>> lowestUniqueNumberPos [9,2,9,9,1,8,8,8,2,1,1]
-- 0
lowestUniqueNumberPos :: [Int] -> Int
lowestUniqueNumberPos xs =
    case lowestUniqueNumber of
        Just (n, _) -> fst . head . Data.List.filter (\(_, x) -> x == n) $ zip [1..] xs
        Nothing -> 0
    where
        lowestUniqueNumber = listToMaybe . toList . Data.IntMap.filter (== 1) . fromListWith (+) $ zip xs [1,1..]

main = do
    content <- getContents
    mapM_ print $ map (lowestUniqueNumberPos . map (read :: String -> Int) . words) . lines $ content
