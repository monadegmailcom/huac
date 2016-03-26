module ParseXml (getDates) where

import Text.XML.HXT.Core

getDates :: String -> IO [String]
getDates input = runX $ readString [withValidate no] input
  //> hasName "date"
  //> getText
