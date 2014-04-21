module Main
    where

main = do
    getContents >>= putStr . unlines . process . lines
