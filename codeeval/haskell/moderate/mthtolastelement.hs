module Main
    where

import Data.Maybe (catMaybes)

mToLast :: String -> Maybe String
mToLast xs = if m > l || m < 1 then Nothing else Just (tokens !! (l - m))
    where
        tokens = words xs
        l = (length tokens) - 1
        m = read . last $ tokens


main = do
    c <- getContents
    let numbers = catMaybes . map mToLast . lines $ c
    mapM_ putStrLn numbers
