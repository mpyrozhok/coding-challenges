module Main
    where

import Data.Char (toLower, isLetter)
import Data.List (sort, intercalate)
import Data.Map (toList, fromListWith) 

beautifulNumber :: String -> Int
beautifulNumber xs = (foldToBeautifulNumber . reverse . sort . map snd . toList . freqMap . map toLower . filter (isLetter)) xs
        where 
            foldToBeautifulNumber freqs = foldl (\acc (f,v) -> acc + f * v) 0 $ zip freqs [26,25..1]
            freqMap xs = fromListWith (+) $ zip xs (repeat 1)
main = do
    content <- getContents
    let numbers = map (beautifulNumber) . lines $ content
    mapM_ print $ numbers
