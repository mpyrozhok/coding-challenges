cycles :: String -> [String]
cycles word = ws ++ [w]
    where
        (w:ws) = take (length word) $ iterate (\(x:xs) -> xs ++ [x]) word

main = do
    getContents >>= putStr . unlines . map unwords . (\(_:xs)-> map cycles xs) . lines
