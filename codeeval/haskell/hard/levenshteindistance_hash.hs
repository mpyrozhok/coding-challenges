module Main
    where

import qualified Data.HashSet as H

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
        insertLetter l = foldr (genWord) [] [0..length w] 
            where
                genWord x y = (take x w ++ l:(drop x w)):y
-- |
-- >>> permChangingSymbols "ads" "kl"
-- ["kds","aks","adk","lds","als","adl"]
permChangingSymbols :: String -> String -> [String]
permChangingSymbols w letters = concatMap (changeLetter) letters
    where
        changeLetter l = foldr (genWord) [] [0..length w - 1]
            where
                genWord x y = (take x w ++ l:(drop (x + 1) w)):y

wordPermutations :: String -> [String]
wordPermutations word = permInsertingSymbols word a ++ permChangingSymbols word a ++ permDeletingSymbols word
    where
        a = "abcdefghijklmnopqrstuvwxyz"

calcNetwork word wds = repNet (H.singleton word) wds 0
    where 
        repNet rs ws ns 
            | H.size rs == 0 = ns 
            | otherwise = repNet friends (H.difference ws friends) (ns + H.size friends)
            where
                friends = H.foldr (\x y -> H.union (H.fromList (filter (flip H.member ws) (wordPermutations x))) y) H.empty rs

main = do
    content <- getContents
    let words = H.fromList . lines $ content
    print $ calcNetwork "hello" words
