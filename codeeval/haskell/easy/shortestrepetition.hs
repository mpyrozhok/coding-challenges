module Main
    where

main = do
    content <- getContents
    mapM_ print $ map period . lines $ content
        where
            period (x:xs) = length (takeWhile (/=x) xs) + 1
