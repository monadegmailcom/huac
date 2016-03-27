import Lib
import Test.QuickCheck
import Test.Hspec
import Control.Monad

data Ascii = Ascii Char

instance Arbitrary Ascii  where
  arbitrary = Ascii `liftM`choose ('\32','\128')

toChar :: Ascii -> Char
toChar (Ascii c) = c

instance Show Ascii where
  show = show . toChar
  showList = (++) . map toChar

qc :: [Ascii] -> Bool
qc s = case t of
  [] -> True
  ' ':_ -> False
  ls -> last ls /= ' '
  where t = trim (map toChar s)

main :: IO ()
main = do
  hspec $
    describe "test trim" $ do
      it "manual test" $
        trim " hallo Welt  " `shouldBe` "hallo Welt"
      it "quickcheck test" $ property
        qc
  verboseCheck qc
