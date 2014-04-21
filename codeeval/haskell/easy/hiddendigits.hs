module Main
    where

import Data.Char (ord, isDigit, isAsciiLower, digitToInt)

transform :: String -> String
transform word = if null filteredWord then "NONE" else filteredWord
    where
        filteredWord = concat . map (show . lettersToDigits) . filter (digitsAndLowerLetters) $ word
            where
                lettersToDigits x = if not $ isDigit x then ord x - 97 else digitToInt x
                digitsAndLowerLetters x = isDigit x || elem x "abcdefghij"

main = do
    content <- getContents
    mapM_ putStrLn $ map transform . lines $ content
