module Main
    where

import Data.List.Split (splitOn)

wordToDigit x = case x of
    "zero" -> "0"
    "one" -> "1"
    "two" -> "2"
    "three" -> "3"
    "four" -> "4"
    "five" -> "5"
    "six" -> "6"
    "seven" -> "7"
    "eight" -> "8"
    "nine" -> "9"

main = do
    content <- getContents
    mapM_ putStrLn $ map (concat . map wordToDigit . splitOn ";") . lines $ content
