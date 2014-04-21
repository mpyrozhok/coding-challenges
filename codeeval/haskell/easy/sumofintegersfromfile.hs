module Main
    where

main = do
    content <- getContents
    let numbers =  map (read :: String -> Int) $ lines content
    print $ sum numbers
