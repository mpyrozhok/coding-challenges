module Main
    where

import Data.List.Split (splitOn)
import Text.Printf (printf)

data Point = Point Int Int Int Int

pointFromList [x1, y1, x2, y2] = Point x1 y1 x2 y2

distance (Point x1 y1 x2 y2) = sqrt . fromIntegral $ ((x1 - x2)^2 + (y1 - y2)^2)

main = do
    content <- getContents
    mapM_ putStrLn $ map ((printf "%.0f" :: Double -> String) . distance . pointFromList . map (read::String -> Int) . words . filter (not . flip elem "(),")) . lines $ content 
