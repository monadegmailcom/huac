import Test.Hspec
import Text.XML.HXT.Core
import Text.HandsomeSoup
import Network.Curl

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "http request" $
    it "check links" $ do
      -- does not work for https links
      --let doc = fromUrl "https://en.wikipedia.org/wiki/Narwhal"
      (_,s) <- curlGetString "https://en.wikipedia.org/wiki/Narwhal" []
      let doc = readString [withParseHTML yes, withWarnings no] s
      links <- runX $ doc >>> css "#bodyContent a" ! "href"
      print links
