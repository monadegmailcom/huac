{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow
import Test.Hspec

data TestField = TestField Int String deriving (Show)
instance FromRow TestField where
  fromRow = TestField <$> field <*> field

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "test sql" $ do
    it "first test" $ do
      conn <- open "test.db"
      r <- query_ conn "SELECT * from test" :: IO [TestField]
      mapM_ print r
      close conn
