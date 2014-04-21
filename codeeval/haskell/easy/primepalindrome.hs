module Main
    where

import Data.List (intercalate)

isPrime :: Integer -> Bool
isPrime x = not $ any (\d -> mod x d == 0) [2..round $ sqrt $ fromIntegral x]

isPalindrome :: Integer -> Bool
isPalindrome x = (reverse $ strx) == strx where strx = show x

main = do
    print $ last $ filter (\x -> isPalindrome x && isPrime x) [1..999]
