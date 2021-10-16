-- Problem Something. CP 

import System.Environment
import System.Directory
import System.IO
 



main :: IO ()

main = do 
    fNames <- getArgs 

    -- Ensure correct usage 
    if length fNames > 2 then do 
        usageErr

    else do 
        let dir = getDirOnly $ last fNames 
        res <- doesDirectoryExist  dir 
        
        --Ensure dir exists 
        if not res then do 
            dfErr $ last fNames 

        else do 
            sourceExist <- doesFileExist $ head fNames 

            -- Ensure source file exists 
            if not sourceExist then do 
                dfErr $ head fNames 


            else do 
                targetExists <- doesFileExist $ last fNames 
                c1 <- readFile $ head fNames 

                -- If target exists, ensure files aren't identical 
                if targetExists then do 
                    copyFile (last fNames) "test/inter.txt"
                    c2 <- readFile "test/inter.txt"
                    let areIdentical = checkIdentical c1 c2

                    if areIdentical then do 
                        idError (head fNames) (last fNames) 

                    -- Overwrite file
                    else do 
                        writeFile (last fNames) c1 

                -- Write to new file 
                else do 
                    writeFile (last fNames) c1 
                    





















-- Check if file contents are identical 
checkIdentical :: String-> String -> Bool 
checkIdentical [] [] = True 
checkIdentical _ [] = False 
checkIdentical [] _ = False 
checkIdentical [x] [y] = True 
checkIdentical (x:xs) (y:ys) 
    | x == y = checkIdentical xs ys 
    | otherwise  = False 


-- Remove filename 
getDirOnly :: String -> String 
getDirOnly (x:xs) 
    | x == '/' = "" 
    | otherwise = x : getDirOnly xs 

-- Identical files error 
idError :: String -> String -> IO ()
idError x y = do 
    let err = "cp: " ++ x ++ " and " ++ y ++  " are identical (not copied)."
    putStrLn err 

-- Dir or file doesn't exist 
dfErr :: String -> IO () 
dfErr x = do
    let err = "cp: " ++ x ++ ": No such file or directory"
    putStrLn err 


-- If > 2 args 
usageErr :: IO () 
usageErr = do putStrLn "usage: cp source_file target_file"