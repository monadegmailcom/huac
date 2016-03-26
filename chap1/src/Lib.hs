module Lib
    ( countWords
    ) where

countWords :: String -> [Int]
countWords input = map (length.words) (lines input)

