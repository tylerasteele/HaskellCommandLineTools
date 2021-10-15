-- Problem 1. Echo --

import System.Environment
import qualified GHC.IO.Device as System

main :: IO ()

main = do 
    args <- getArgs
    printArgs args
    putChar '\n'

printArgs :: [String] -> IO ()
printArgs [] = return ()
printArgs [x] = putStr x 
printArgs (x:xs) = do
    putStr x 
    putStr " " 
    printArgs xs    


{-
Concat -- How to read files in haskell
import System.Directory
;
main :: IO()
main = do 
    fs <- getArgs
    contents <- readFiles fs
    putStrLn( head contents ) 

readFiles :: [String] -> IO [String]
readFiles [] = return []
readFiles (x:xs) =
    do 
    if doesExist then do
        contents <- readFile x
        otheres = < readFiles xs
        return (contents:others)
    else do
        others <- readFiles xs
        return ("cat: " ++ x ++ ": Not such file or directory" : others)



cabal -v0 run cat test/haiku.txt

-- take contents // What if file doesn't exists? 
-- Make own error message, all have access to directory package
-- Others are catted files in various forms

System.Directory
Operations on files/directories
doesFileExist function


Head function:
If you have the contents, how would you get the first 10 lines of it

ie:

-- Prelude lines function (Lines in string)
get10Lines :: String -> [String]
get10Lines s = lines s 

take 10 lines

unlines that does opposite (Combine lines into single string

Tail function: 
Reverse, take 10 lines
unlines reverse take 10 reverse lines s



)
Rev map reverse over lines 


For curl
http library
dns library -- Need because need to see if resolves to ip -- network.dns.lookup (Types to line up, bytestring) => Resolver rs <- makeresolveseed ddefaultresolveconf (Right [93.184.....]) Right is like maybe type
    import Network.DNS.Lookup 

    main :: IO()
    main = do
        rs  <-  makeResolvSeed defaultResolvConf
        dn <- withResolver rs $ \resolver -> lookupA resolver hostname
            Left err ->
            Right ip -> 


    Maybe helps code if something fails
    Either helps if want to include message about that failure (left error | right successful result) (DNS error | IP address)

bytestring

-}