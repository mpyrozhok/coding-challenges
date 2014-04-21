module Main
    where

import Data.Char (digitToInt)

main = do
    content <- getContents
    let numbers = map (\x -> show (sumOfDigitPowers x) == x) . lines $ content
    mapM_ print $ numbers
    where
        sumOfDigitPowers x = (sum . map(\d -> (digitToInt d)^(length x))) x
