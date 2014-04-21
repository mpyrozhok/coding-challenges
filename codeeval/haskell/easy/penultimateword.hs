module Main
    where

main = do
    content <- getContents
    let nextToLastWords = map (last . init . words) . lines $ content
    mapM_ putStrLn $ nextToLastWords
