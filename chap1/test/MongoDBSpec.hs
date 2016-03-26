{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
import           Database.MongoDB
import           Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "test mongoDB" $
    it "first test" $ do
      let db = "test"
      pipe <- connect (host "127.0.0.1")
      e <- access pipe master db run
      close pipe
      print e

run = getData
getData = rest =<< find (select [] "people") {sort=[]}
