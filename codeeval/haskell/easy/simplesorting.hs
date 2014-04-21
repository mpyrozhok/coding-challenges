module Main
    where

import Data.Char (digitToInt)
import Data.List (sort, intercalate)
import Text.Printf (printf)

main = do
    content <- getContents
    let numbers = map (map (read :: String -> Double) . words) . lines $ content
    mapM_ putStrLn $ map (intercalate " " . map (printf "%.3f" :: Double -> String) . sort) $ numbers
