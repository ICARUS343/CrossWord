import Test.Hspec
import Lib
import Data

gwc = gridWithCoords grid

testFindWord word =
  let (Just result) = findWord gwc word
      string = map cell2char result
  in string `shouldBe` word

main :: IO ()
main = hspec $ do
  describe "formatGrid" $ do
    it "should be able to concantenate every line with a newline" $ do
      (formatGrid (gridWithCoords ["ads", "adssad", "aadsad"])) `shouldBe` "ads\nadssad\naadsad\n"

  describe "findWord" $ do
    it "should find words that exist on the Grid" $ do
        testFindWord "HASKELL"
        testFindWord "PERL"
    it "should not find words that do not exist on the Grid" $ do
      findWord gwc "HA5KELL" `shouldBe` Nothing

  describe "findWords" $ do
    it "should find all the strings within languages list" $ do
        let found = findWords gwc languages
            asString = map (map cell2char) found
        asString `shouldBe` languages
    it "should not find the strings not within languages GRID" $ do
      findWords gwc ["FRENCH","GERMAN"] `shouldBe` []
