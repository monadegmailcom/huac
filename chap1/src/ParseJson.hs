{-# LANGUAGE OverloadedStrings #-}

module ParseJson where

import Data.Aeson
import Control.Applicative
import qualified Data.ByteString.Lazy as B
import Data.ByteString.Char8

data Mathematician = Mathematician
  { name        :: String
  , nationality :: String
  , born        :: Int
  , died        :: Maybe Int } deriving (Show)


instance FromJSON Mathematician where
  parseJSON (Object v) = Mathematician
    <$> (v .: "name")
    <*> (v .: "nationality")
    <*> (v .: "born")
    <*> (v .:? "died")

parseJson :: String -> Maybe Mathematician
parseJson = decode . B.fromStrict . pack
