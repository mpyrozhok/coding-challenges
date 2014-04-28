import qualified Data.ByteString.Char8 as BS
import qualified Data.IntMap as IM
import Data.List (sort)

findMinSum :: [Int] -> [Int] -> [Int]
findMinSum xs ts = map (elementCount . largerSum) ts
    where
        q = reverse . sort $ xs
        sums = IM.fromList $ scanl (\(s, q) x-> (s + x, q + 1)) (0, 0) q
        largerSum s = IM.lookupGE s sums
        elementCount Nothing = (-1)
        elementCount (Just (_, q)) = q

getInt = (\(Just (x, _)) -> x) . BS.readInt

main :: IO ()
main = BS.getContents >>= mapM_ print . (\([s]:xs:[t]:ts) -> findMinSum xs (concat ts)) . map (map getInt . BS.words) . BS.lines 
