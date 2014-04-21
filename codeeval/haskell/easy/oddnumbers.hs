module Main
    where

main = do
    mapM_ print $ filter odd [1..99]
