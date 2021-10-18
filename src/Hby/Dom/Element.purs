module Hby.Dom.Element where

import Prelude
import Effect (Effect)
import Hby.Dom.Alias (Html, Id, Value)
import Hby.Dom.Event (ChangeEventData, ClickEventData)

foreign import data Element :: Type

-- showElement
_showElement :: Element -> String
_showElement _ = "这是一个dom对象"

instance show_Element :: Show Element where
  show a = _showElement a

-- getElementById
foreign import getElementById :: String -> Effect Element

-- getElementStrAttr
foreign import getElementStrAttr :: Element -> String -> Effect String

-- setValue
foreign import setValue :: Element -> Value -> Effect Unit

foreign import setValueById :: Id -> Value -> Effect Unit

-- setHtml
foreign import setHtml :: Element -> Html -> Effect Unit

foreign import setHtmlById :: Id -> Html -> Effect Unit

-- setOn
foreign import onClick :: Element -> (ClickEventData -> Effect Unit) -> Effect Unit

foreign import onChange :: Element -> (ChangeEventData -> Effect Unit) -> Effect Unit
