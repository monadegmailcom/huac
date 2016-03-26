module ReadFile
  ( readFromFile ) where

import System.Environment (getArgs)

readFromFile :: IO (String,String)
readFromFile = do
  args <- getArgs
  let filename = case args of
        (a:_) -> a
        _ -> error "no input file"

  input <- readFile filename
  return (filename,input)

