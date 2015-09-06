module Main
    where

import Data.Map (fromList, (!))

src = "abcdefghijklmnopqrstuvwxyz"
dst = "ynficwlbkuomxsevzpdrjgthaq" --
transmap = fromList $ zip dst src

trans :: String -> String
trans = map (\s -> transmap ! s)

main = getContents >>= putStr . unlines . map (unwords . map trans . words) . lines
