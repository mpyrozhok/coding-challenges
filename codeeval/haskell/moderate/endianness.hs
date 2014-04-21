module Main
    where
import Data.Binary
import Data.Binary.Put
import Data.Word
data Endianness = BigEndian | LittleEndian deriving Show

getEndianness :: Endianness
getEndianness = if (decode $ runPut $ putWord16host 42 :: Word8) == 42 then LittleEndian else BigEndian

main = do
    print getEndianness
