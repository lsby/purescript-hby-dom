module Test.Main where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Class.Console (log)
import Effect.Exception (message, try)
import Hby.Dom.Dom (onLoad, openUrl, setBodyHtml)
import Hby.Dom.Element (getElementById, getElementStrAttr, onClick, setHtmlById, setValue)
import Text.Smolder.HTML (button, span)
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
              span ! id "b1" $ do text "这里应该显示和输入框相同的值:"
              span ! id "b2" $ do text "初始值"
        S.div
          $ do
              span $ do text "这里的输入框值应该是aaa:"
              S.input ! id "a2" ! value ""
        S.div
          $ do
              button ! id "openBut" $ text "测试打开网页"

safeEffect :: Effect Unit -> Effect Unit
safeEffect e = do
  c <- try e
  case c of
    Left err -> log $ message err
    Right _ -> e

main :: Effect Unit
main =
  onLoad
    $ safeEffect do
        setBodyHtml $ render initHtml
        --
        a1 <- getElementById "a1"
        v <- getElementStrAttr a1 "value"
        setHtmlById "b2" v
        --
        a2 <- getElementById "a2"
        setValue a2 "aaa"
        --
        openBut <- getElementById "openBut"
        onClick openBut (\_ -> openUrl "http://www.google.com")
