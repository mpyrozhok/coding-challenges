module Main
    where

import Data.Bits (shiftR, (.&.))
import Data.Char (intToDigit)

dec2bin :: Int -> String
dec2bin x = map intToDigit $ toBinary x []
    where
        toBinary :: Int -> [Int] -> [Int]
        toBinary n res = if n > 1 then toBinary (shiftR n 1) ((n .&. 1):res) else n:res

main = do
    getContents >>= putStr . unlines . map (dec2bin . read) . lines
