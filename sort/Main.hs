-- Problem 5. Sort 

import System.Environment
import System.Directory
import System.IO


main :: IO ()

main = do 
    fNames <- getArgs 

    -- do all files exists?
    if andAnd fNames then 
        putStrLn "True"
    else 
        putStrLn "False "


    fileHandle fNames 




-- Does file and file exist?
{-
andAnd :: [String] -> Bool 
andAnd [] = True 
andAnd [x] = do 
    a <- doesFileExist x 
    if a then do  
        return True 
    else do 
        return False 
  
andAnd (x:xs) = do 
    a <- doesFileExist x 
    a && andAnd xs 
-}

--fileHandle :: [String] -> IO()
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
            putStrLn (myRev fileContents)
             
        else do
            let exc = "sort: " ++ x ++ ": No such file or directory"
            putStrLn exc


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







{-
insertLine :: [String] -> [String] -> [String]
insertLine x [] = x 
insertLine n (x:xs) 
    | head n <  x  = n ++ (x:xs)
    | otherwise = x : insertLine n xs 
-}