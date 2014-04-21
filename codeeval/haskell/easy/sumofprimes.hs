module Main
    where

isPrime :: Integer -> Bool
isPrime x = not $ any (\d -> mod x d == 0) [2..round $ sqrt $ fromIntegral x]

main = do
    print $ sum $ take 1000 $ filter (\x -> isPrime x) [2..]
