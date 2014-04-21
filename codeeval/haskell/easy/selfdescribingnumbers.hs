module Main
    where

import qualified Data.IntMap as IM
import Data.Char (digitToInt)

isSelfDescribing :: String -> Bool
isSelfDescribing x = 
    let digitFreq = IM.fromListWith (+) $ zip (map digitToInt x) (repeat 1)
    in not $ any (\(i, count) -> isNotSelfDescribingDigit (digitToInt count) (IM.lookup i digitFreq)) $ zip [0..] x
    where
        isNotSelfDescribingDigit x Nothing = x /= 0
        isNotSelfDescribingDigit x (Just frequency) = x /= frequency
        

main = do
    content <- getContents
    let numbers = lines $ content
    mapM_ print $ [if isSelfDescribing n then 1 else 0 | n <- numbers]
