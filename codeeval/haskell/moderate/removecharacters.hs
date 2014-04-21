module Main
    where

import Data.List.Split(splitOn)


main = do
    content <- getContents
    let pairs = (map (splitOn ",") . lines) content
    mapM_ putStrLn $ map (\[l, f] -> filterPair f l) pairs
    where
        filterPair f = filter (\x -> not $ elem x (tail f))
