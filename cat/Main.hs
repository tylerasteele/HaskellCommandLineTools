-- Problem 2. Cat --

import System.Environment
import System.Directory
import System.IO

import qualified GHC.IO.Device as System
-- What is line 4? Why does it break

main :: IO ()

main = do 
    fNames <- getArgs 
    fileHandle fNames


fileHandle :: [String] -> IO()
fileHandle [] = return ()
fileHandle [x] = dispFiles x
fileHandle (x:xs) = do
    dispFiles x
    fileHandle xs 
    
dispFiles :: String -> IO()
dispFiles x = do
    fileExist <- doesFileExist x

    if fileExist 
        then do
            contents <- readFile x 
            putStrLn contents 
        else do
            let exc = "cat: " ++ x ++ ": No such file or directory"
            putStrLn exc