module Main
    where

import Data.Char (toLower)

alphabet = "abcdefghijklmnopqrstuvwxyz"

missingCharacters xs = [x | x <- alphabet, notElem x (map toLower xs)]

main = do
    getContents >>= putStr . unlines . map (process . missingCharacters) . lines
    where
        process :: String -> String
        process [] = "NULL"
        process xs = xs
