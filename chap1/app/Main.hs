module Main where

import CountWords
import ReadFile
import ParseCsv

main :: IO ()
main = do
  (file,input) <- readFromFile
  print $ countWords input
  print $ parseFromCsv file input



