-- Problem 3. Rev 

import System.Environment
import System.Directory
import System.IO

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
            fileContents  <- readFile x 
            putStr (myRev fileContents)
             
        else do
            let exc = "rev: " ++ x ++ ": No such file or directory"
            putStrLn exc

myRev :: String -> String 
myRev xs = unlines (map reverse (lines xs ))
