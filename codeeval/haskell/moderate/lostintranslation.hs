module Main
    where

import Data.Map (fromList, (!))

src = "abcdefghijklmnopqrstuvwxyz"
dst = "ynficwlbkuomxsevzpdrjgthaq" --
transmap = fromList $ zip dst src

trans :: String -> String
trans word = map (\s -> transmap ! s) word

main = do
    getContents >>= putStr . unlines . map (unwords . map trans . words) . lines
