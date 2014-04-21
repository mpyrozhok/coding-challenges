module Main
    where

import Numeric (readHex)


main = do
    content <- getContents
    let numbers = (foldl (++) [] . map ((map fst) . readHex) . lines) content
    mapM_ print $ numbers
