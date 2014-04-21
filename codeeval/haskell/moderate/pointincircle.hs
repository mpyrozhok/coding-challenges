module Main
    where

import Data.List.Split (splitOn)

data Point = Point Float Float

isInCircle :: Point -> Point -> Float -> Bool
isInCircle (Point x y) (Point cx cy) radius = sqrt ((x - cx)^2 + (y - cy)^2) <= radius

main = do
    getContents >>= putStr . unlines . process . lines
    where
        process = map (boolToStr . elements . map (head . drop 1 . splitOn ":") . splitOn ";" . filter (flip notElem "()"))
        strToFloats :: String -> Point
        strToFloats xs = let [x, y] = map read . splitOn "," $ xs in Point x y
        elements xs = let p = strToFloats (xs !! 0); r = (read :: String -> Float) (xs !! 1); c = strToFloats (xs !! 2) in isInCircle p c r
        boolToStr True = "true"
        boolToStr False = "false"
