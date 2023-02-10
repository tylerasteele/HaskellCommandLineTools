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
