module Main
    where

import Data.List.Split (splitOn)
import Data.List (maximumBy)
import Data.Array.IO
import Data.Char (digitToInt)

getMajorElement :: [Int] -> Maybe Int
getMajorElement xs =
    if (snd m) > (s `div` 2) then Just (fst m) else Nothing
    where
        s = sum xs
        m = maximumBy (\(x, y) (x1, y1) -> compare y y1) $ zip [0..100] xs 

showMaybe :: Maybe Int -> String
showMaybe (Just m) = show m
showMaybe Nothing = "None"

parseNum :: String -> Int
parseNum xs = sum [(digitToInt x) * m | (x, m) <- zip (reverse xs) (iterate (*10) 1)]

fillArray :: [Int] -> IO [Int]
fillArray xs = do
    arr <- newArray (0, 100) 0 :: IO (IOUArray Int Int)
    mapM_ (incrementCounter arr) xs
    getElems arr
    where
        incrementCounter arr i = do
            x <- readArray arr i
            writeArray arr i (x + 1)

main = do
    c <- getContents
    f <- sequence . map (fillArray . (map parseNum . splitOn ",")) . lines $ c 
    putStr . unlines . map (showMaybe . getMajorElement) $ f 
