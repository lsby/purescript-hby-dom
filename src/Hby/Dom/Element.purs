module Hby.Dom.Element where

import Prelude
import Data.Either (Either(..))
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
foreign import _getElementById ::
  (String -> Either String Element) ->
  (Element -> Either String Element) ->
  String ->
  Effect (Either String Element)

getElementById :: String -> Effect (Either String Element)
getElementById id = _getElementById Left Right id

-- setValueById
foreign import _setValueById ::
  (String -> Either String Unit) ->
  (Unit -> Either String Unit) ->
  String ->
  String ->
  Effect (Either String Unit)

setValueById :: Id -> Value -> Effect (Either String Unit)
setValueById id value = _setValueById Left Right id value

-- setHtmlById
foreign import _setHtmlById ::
  (String -> Either String Unit) ->
  (Unit -> Either String Unit) ->
  String ->
  String ->
  Effect (Either String Unit)

setHtmlById :: Id -> Html -> Effect (Either String Unit)
setHtmlById id html = _setHtmlById Left Right id html

-- setOnClick
foreign import onClick :: Element -> (ClickEventData -> Effect Unit) -> Effect Unit

-- setOnChange
foreign import onChange :: Element -> (ChangeEventData -> Effect Unit) -> Effect Unit

-- getElementStrAttr
foreign import _getElementStrAttr ::
  (String -> Either String String) ->
  (String -> Either String String) ->
  Element ->
  String ->
  Effect (Either String String)

getElementStrAttr :: Element -> String -> Effect (Either String String)
getElementStrAttr = _getElementStrAttr Left Right
