module Main
    where

import Data.List (splitAt)
import Data.Foldable (toList)
import Data.Set (Set, fromList, (\\), intersection, size, insert, union, member)

-- |
-- >>> permDeletingSymbols "ab"
-- ["b","a"]
-- >>> permDeletingSymbols ""
-- []
permDeletingSymbols :: String -> [String]
permDeletingSymbols w = map (\x -> take x w ++ drop (x + 1) w) [0..length w - 1]

-- | 
-- >>> let letters = "zx"
-- >>> permInsertingSymbols "ab" letters
-- ["zab","azb","abz","xab","axb","abx"]
-- >>> permInsertingSymbols "ab" []
-- []
-- >>> permInsertingSymbols [] []
-- []
permInsertingSymbols :: String -> String -> [String]
permInsertingSymbols w letters = concatMap (insertLetter) letters
    where
        insertLetter l = foldr (\x y -> let (p, s) = splitAt x w in (p ++ l:s):y) [] [0..length w] 
-- |
-- >>> permChangingSymbols "ads" "kl"
-- ["kds","aks","adk","lds","als","adl"]
permChangingSymbols :: String -> String -> [String]
permChangingSymbols w letters = concatMap (changeLetter) letters
    where
        changeLetter l = foldr (\x y -> let (p, s) = splitAt x w in (p ++ l:(drop 1 s)):y) [] [0..length w - 1]

wordPermutations :: String -> [String]
wordPermutations word = permInsertingSymbols word l ++ permChangingSymbols word l ++ permDeletingSymbols word
    where
        l = "abcdefghijklmnopqrstuvwxyz"

calcNetwork :: String -> Set String -> Int
calcNetwork word wds = repNet [word] wds 0
    where 
        repNet [] _ ns  = ns
        repNet (w:rs) ws ns = repNet (toList friends ++ rs) (ws \\ (insert w friends)) (ns + size friends)
            where
                friends = fromList $ filter (flip member ws) $ wordPermutations w

main = do
    content <- getContents
    let words = fromList . lines $ content
    print $ calcNetwork "hello" words
