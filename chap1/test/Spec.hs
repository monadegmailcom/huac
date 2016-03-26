import Test.Hspec
import ParseJson
import ParseCsv
import ParseXml
import ParseHtml
import Data.Maybe
import Data.Either

main :: IO ()
main = hspec $ do
  describe "test json" $
    it "check fields" $ do
      input <- readFile "input.json"
      let m = parseJson input
      m `shouldSatisfy` isJust
      (name . fromJust) m `shouldBe` "Gauss"
  describe "test csv" $
    it "check find oldest" $ do
      let filename = "input.csv"
      input <- readFile filename
      let result = parseFromCsv filename input
      result `shouldSatisfy` isRight
      let Right r = result
      r `shouldBe` ["Becca","23"]
  describe "test xml" $
    it "check dates" $ do
      input <- readFile "input.xml"
      dates <- getDates input
      dates `shouldBe` ["Thu Dec 18 15:03:23 EST 2014","Fri Dec 19 3:12:00 EST 2014"]
  describe "test html" $
    it "check biggest capacity" $ do
      input <- readFile "input.html"
      row <- parseHtml input
      row `shouldBe` ["PHIL 1000","9:30","120"]
