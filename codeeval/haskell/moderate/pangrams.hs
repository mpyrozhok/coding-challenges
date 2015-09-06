module Main
    where

import Data.Char (toLower)

alphabet = "abcdefghijklmnopqrstuvwxyz"

missingCharacters xs = [x | x <- alphabet, x `notElem` map toLower xs]

main = getContents >>= putStr . unlines . map (process . missingCharacters) . lines
    where
        process :: String -> String
        process [] = "NULL"
        process xs = xs
