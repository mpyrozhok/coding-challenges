module Main
    where

import System.Environment (getArgs)
import System.Posix.Files (getFileStatus, fileSize)

main = do
    args <- getArgs 
    stat <- getFileStatus $ head args 
    print $ fileSize stat
