module Main where

import Lib
import Data
import System.IO
import System.Random

main :: IO ()
main = do
  gen <- newStdGen
  let filledIngrid = fillInBlanks gen grid
      game = makeGame filledIngrid languages
  hSetBuffering stdout NoBuffering
  playTurn game

playTurn game = do
  putStrLn . formatGame $ game
  putStr "Please enter a word>>>>"
  word <- getLine
  putStrLn $ "You entered > " ++ word
  let newGame = playGame game word
  if completed newGame then
    putStrLn "CONGRATULATIONS !!!"
  else
    playTurn newGame
