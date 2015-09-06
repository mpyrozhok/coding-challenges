module Main
    where

import qualified Data.Map (fromListWith, (!))
import Control.Monad (liftM)

getFirstUniqueCharacter :: String -> Char
getFirstUniqueCharacter xs = head $ filter unique xs
    where
        unique x = (freqMap Data.Map.! x) == 1
        freqMap = Data.Map.fromListWith (\x y -> y + 1) $ zip xs [1,1..]

main = getContents >>=
    mapM_ (putStrLn . (:"") . getFirstUniqueCharacter) . lines
