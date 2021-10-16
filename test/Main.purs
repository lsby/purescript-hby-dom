module Test.Main where

import Prelude
import Effect (Effect)
import Hby.Dom.Dom (onLoad, openUrl, setBodyHtml)
import Hby.Dom.Element (getElementById, getElementStrAttr, onClick, setHtmlById)
import Hby.EEffect (toEEffect, toEffectUnit)
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
        S.div
          $ do
              span ! id "b1" $ do text "这里应该显示和输入框相同的值:"
              span ! id "b2" $ do text "初始值"
        S.div
          $ do
              button ! id "openBut" $ text "测试打开网页"

main :: Effect Unit
main =
  onLoad
    $ toEffectUnit do
        toEEffect $ setBodyHtml $ render initHtml
        -- 
        a1 <- getElementById "a1"
        v <- getElementStrAttr a1 "value"
        setHtmlById "b2" v
        -- 
        openBut <- getElementById "openBut"
        toEEffect $ onClick openBut (\_ -> openUrl "http://www.google.com")
