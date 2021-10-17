-- Problem 4. Head  

import System.Environment
import System.Directory
import System.IO


main :: IO ()

main = do 
    fNames <- getArgs 

    -- If single file, just take 10, else file tracking ==> 
    if length fNames == 1 then 
        dispFilesS $ head fNames 

    else do
        fileHandleM fNames 


-- Ways to condense dispFileS and dispFilesM -> State?
 
-- Display files in desired manner 
dispFilesS :: String -> IO()
dispFilesS x = do
    fileExist <- doesFileExist x

    if fileExist 
        then do
            fileContents  <- readFile x 
            putStrLn (get10 fileContents)
             
        else do
            let exc = "tail: " ++ x ++ ": No such file or directory"
            putStrLn exc


-- Handle if multiple files D
fileHandleM :: [String] -> IO()
fileHandleM [x] = dispFilesM x
fileHandleM (x:xs) = do
    dispFilesM x

    -- Dumb spacing: 
    fileExist <- doesFileExist (head xs) 
    fileExist1 <- doesFileExist x
    if fileExist && fileExist1 then do 
        putStr "\n"
    else do 
        putStr ""

    fileHandleM xs 

    
    
-- Display files in desired manner 
dispFilesM :: String -> IO()
dispFilesM x = do
    fileExist <- doesFileExist x

    if fileExist 
        then do
            fileContents  <- readFile x 
            let fileId = "==> " ++ x ++ " <=="
            putStrLn fileId
            putStr (get10 fileContents)
             
        else do
            let exc = "head: " ++ x ++ ": No such file or directory"
            putStrLn exc


get10 :: String -> String
get10 xs = unlines (reverse (take 10 (reverse (lines xs))))