-- Final Problem. Curl 

import System.Environment
import System.Directory
import System.IO
import Network.Browser 
import Network.HTTP 

main :: IO ()
main = do 
    args <- getArgs 

    if Prelude.null args then do 
        usageErr 

    else do 
        let url = remExtraneous(testArg $ head args)
       
        rsp <- Network.Browser.browse $ do
            setAllowRedirects True
            setOutHandler $ const (return ())
            request $ getRequest url  
        putStrLn $ rspBody $ snd rsp

testArg :: String -> String
testArg x 
    | head x /= 'h' && (x !! 1) /= 't' && (x !! 2) /= 't' && (x !! 3) /= 'p' = uriHeader ++ x
    | otherwise = x 

remExtraneous :: String -> String 
remExtraneous [] = [] 
remExtraneous [x] 
    | x /= '\\' = [x] 
remExtraneous (x:xs) 
    | x /= '\\' = x : remExtraneous xs 
    | otherwise = remExtraneous xs  

uriHeader :: String 
uriHeader = "http://"

usageErr :: IO () 
usageErr = do 
    putStrLn "usage: curl url [urls]"
