module ParseCsv (parseFromCsv) where

import           Text.CSV
import           Text.Parsec.Error

parseFromCsv :: String -> String -> Either ParseError Record
parseFromCsv file = either Left doWork . parseCSV file

doWork = Right . findOldest . tail . filter (\x -> length x == 2)

findOldest :: [Record] -> Record
findOldest [] = []
findOldest xs = foldl1 (\a x -> if age x > age a then x else a) xs
age [_,x] = toInt x
toInt :: String -> Int
toInt = read
