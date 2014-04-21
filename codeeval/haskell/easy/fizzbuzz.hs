module Main
    where

import Data.List (intercalate)

fizzBuzz :: Int -> Int -> Int -> String
fizzBuzz x y n | mod n x == 0 && mod n y == 0 = "FB"
    | mod n x == 0 = "F"
    | mod n y == 0 = "B"
    | otherwise = show n

fizzBuzzRange :: Int -> Int -> Int -> [String]
fizzBuzzRange x y till = [fizzBuzz x y n | n <- [1..till]]
    
main = do
    content <- getContents
--    let numbers = [map (read :: String -> Int) tokens | tokens <- map words . lines $ content]
    let numbers =  map (map (read :: String -> Int)) $ map words . lines $ content
    mapM_ putStrLn [intercalate " " line | line <- [fizzBuzzRange x y till | x:y:till:[] <- numbers]]
