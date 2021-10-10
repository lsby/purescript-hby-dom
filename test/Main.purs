module Test.Main where

import Prelude
import Control.Apply (lift2)
import Data.Either (Either(..))
import Data.Traversable (sequence)
import Effect (Effect)
import Effect.Class.Console (log)
import Hby.Dom.Dom (onLoad, openUrl, setBodyHtml)
import Hby.Dom.Element (Element, getElementById, getElementStrAttr, onClick)
import Text.Smolder.HTML (button)
import Text.Smolder.HTML (div, input) as S
import Text.Smolder.HTML.Attributes (id, value)
import Text.Smolder.Markup (Markup, text, (!))
import Text.Smolder.Renderer.String (render)

initHtml :: forall a. Markup (a -> Effect Unit)
initHtml =
  S.div
    $ do
        S.div
          $ do
              S.input ! id "a1" ! value "aa1"
        S.div
          $ do
              button ! id "openBut" $ text "测试打开网页"

main :: Effect Unit
main =
  onLoad do
    setBodyHtml $ render initHtml
    ele <- testGetById
    _ <- testGetStrAttr ele
    _ <- testOnClickAndOpen
    pure unit
  where
  testOnClickAndOpen :: Effect Unit
  testOnClickAndOpen = do
    e <- getElementById "openBut"
    _ <- sequence $ lift2 onClick e $ pure (\_ -> openUrl "http://www.google.com")
    pure unit

  testGetById :: Effect (Either String Element)
  testGetById = do
    e <- getElementById "a1"
    case e of
      Left err -> do
        log $ "错误:" <> err
      Right a -> do
        log $ "getElementById:" <> (show $ eq (show a) "这是一个dom对象")
    pure e

  testGetStrAttr :: Either String Element -> Effect (Either String String)
  testGetStrAttr ele = do
    s <- (map join) <<< sequence $ lift2 getElementStrAttr ele (pure "value")
    case s of
      Left err -> do
        log $ "错误:" <> err
      Right a -> do
        log $ "getElementStrAttr:" <> (show $ eq a "aa1")
    pure s
