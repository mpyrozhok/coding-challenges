import qualified Data.ByteString.Char8 as BS
import qualified Data.Map as M


data Trie a = Trie { value :: Maybe a,
                     children :: M.Map Char (Trie a) } deriving (Show)
-- | 
-- >>> insert [] "abc"
-- Trie {value = Nothing, children = fromList [('a',Trie {value = Just "a", children = fromList [('b',Trie {value = Just "ab", children = fromList [('c',Trie {value = Just "abc", children = fromList []})]})]})]}
insert :: String -> String -> Trie String
insert [] (x:postfix) = Trie Nothing (M.insert x (insert [x] postfix) M.empty)
insert prefix [] = Trie (Just prefix) M.empty
insert prefix (x:postfix) = Trie (Just prefix) (M.singleton x (insert (prefix ++ [x]) postfix))

-- |
-- >>> singleton "abc"
-- Trie {value = Nothing, children = fromList [('a',Trie {value = Just "a", children = fromList [('b',Trie {value = Just "ab", children = fromList [('c',Trie {value = Just "abc", children = fromList []})]})]})]} 
singleton  :: String -> Trie String
singleton s = insert [] s

-- |
-- >>> let a = insert [] "abc"
-- >>> a
-- Trie {value = Nothing, children = fromList [('a',Trie {value = Just "a", children = fromList [('b',Trie {value = Just "ab", children = fromList [('c',Trie {value = Just "abc", children = fromList []})]})]})]}
-- >>> update [] "abn" a
-- Trie {value = Nothing, children = fromList [('a',Trie {value = Just "a", children = fromList [('b',Trie {value = Just "ab", children = fromList [('c',Trie {value = Just "abc", children = fromList []}),('n',Trie {value = Just "abn", children = fromList []})]})]})]}
update :: String -> String -> Trie String -> Trie String
update prefix [] trie = trie
update prefix (x:postfix) (Trie value children) =
    case M.lookup x children of
        Nothing -> Trie value (M.insert x (insert newPrefix postfix) children)
        Just child -> Trie value (M.insert x (update newPrefix postfix child) children)
    where
        newPrefix = prefix ++ [x]

-- |
-- >>> fromList ["ab", "an"]
-- Trie {value = Nothing, children = fromList [('a',Trie {value = Just "a", children = fromList [('b',Trie {value = Just "ab", children = fromList []}),('n',Trie {value = Just "an", children = fromList []})]})]}
fromList :: [String] -> Trie String
fromList [x] = singleton x
fromList (x:xs) = foldl (\acc word -> update [] word acc) (singleton x) xs

-- |
-- >>> let t = fromList ["ab", "an"]
-- >>> isElementOf "ab" t
-- True
-- >>> isElementOf "an" t
-- True
-- >>> isElementOf "" t
-- False
-- >>> isElementOf "ak" t
-- False
-- >>> isElementOf "a" t
-- False
isElementOf :: String -> Trie String -> Bool
[] `isElementOf` (Trie value children) = M.null children
(x:xs) `isElementOf` (Trie value children) = case M.lookup x children of
    Nothing -> False
    Just child -> xs `isElementOf` child

getInt = (\(Just (x, _)) -> x) . BS.readInt

-- |
-- >>> let d = fromList ["abra", "ka", "dabra"]
-- >>> pwdIsValid "abra" d
-- "abra"
-- >>> pwdIsValid "kaabra" d
-- "ka abra"
-- >>> pwdIsValid "kadabraka" d
-- "ka dabra ka"
-- >>> pwdIsValid "kadabraabra" d
-- "ka dabra abra"
-- >>> pwdIsValid "kadabraabrad" d
-- "WRONG PASSWORD"
pwdIsValid :: String -> Trie String -> String
pwdIsValid (x:xs) dict = iter [x] xs []
    where
        iter :: String -> String -> [String] -> String
        iter prefix [] ws
            | prefix `isElementOf` dict = unwords . reverse $ (prefix:ws)
            | otherwise = "WRONG PASSWORD"
        iter prefix (x:postfix) ws
            | prefix `isElementOf` dict = iter [x] postfix (prefix:ws)
            | otherwise = iter (prefix ++ [x]) postfix ws

-- |
-- >>> testPasswords [["6"], ["because", "can", "do", "must", "we", "what"], ["wedowhatwemustbecausewecan"]]
-- ["we do what we must because we can"]
testPasswords :: [[String]] -> [String]
testPasswords cases = testPasswords' cases []
    where
        testPasswords' [] answers = reverse answers
        testPasswords' (_:ws:[pwd]:rest) answers= testPasswords' rest ((pwdIsValid pwd $ fromList ws):answers)

main :: IO ()
main = getContents >>= mapM_ putStrLn . (\(ncases:cases) -> testPasswords cases) . map words . lines 
