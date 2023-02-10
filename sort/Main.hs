-- Problem 5. Sort 

import System.Environment
import System.Directory
import System.IO

main :: IO ()

main = do 
    fNames <- getArgs 
    test (allExists fNames) fNames 

-- Determine if all files exist 
allExists :: [String] -> [IO Bool] 
allExists [x] = do [doesFileExist x]
allExists (x:xs) = do 
    doesFileExist x : allExists xs 

-- Get content of all files 
getCont :: [String] -> [IO String] 
getCont [x] = do [readFile x]
getCont (x:xs) = do 
    readFile x : getCont xs 

-- If all bools are true, then do stuff on strings 
test :: [IO Bool] -> [String] -> IO()

test [x] y= do 
    res <- x 

    if res then do 
        -- Recursed all bools, perform string processing 
        finish y 

    else do
        putStrLn "sort: No such file or directory"

test (x:xs) y = do 
    res <- x 
    if res then do 
        test xs y
    
    else do  
        putStrLn "sort: No such file or directory"
    
finish :: [String] -> IO () 
finish xs = do 

    if length xs == 1 then do
        contents <- readFile $ head xs 
        putStr $ sortSmoosh contents 

    else if length xs ==2 then do
        c1 <- readFile $ head xs 
        c2 <- readFile $ last xs 
        let c0 = smoosh c1 c2 
        putStr $ sortSmoosh c0

    else if length xs == 4 then do 
        c1 <- readFile $ head xs
        c2 <- readFile $ xs !! 1 
        c3 <- readFile $ xs !! 2  
        c4 <- readFile $ xs !! 3  
        let c0 = c1 ++ c2 ++ c3 ++ c4 
        putStr $ sortSmoosh c0 

    else do 
        putStr ":,("

smoosh :: String -> String -> String 
smoosh x y = x ++ y 

sortSmoosh :: String -> String 
sortSmoosh xs = unlines( iSortLine ( lines xs)) 

insertLine :: String -> [String] -> [String]
insertLine x [] = [x] 
insertLine n (x:xs) 
    | head n < head x  = n : x : xs 
    | otherwise = x : insertLine n xs 

iSortLine ::  [String] -> [String ]
iSortLine = foldr insertLine [] 

fileHandle :: [String] -> IO ()
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
            putStrLn fileContents
             
        else do
            let exc = "sort: " ++ x ++ ": No such file or directory"
            putStrLn exc
