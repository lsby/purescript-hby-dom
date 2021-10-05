module Hby.DOM.Event where

import Hby.DOM.Class (class GetValue)

data ChangeEventData
  = ChangeEventData

data ClickEventData
  = ClickEventData

-- getValue
foreign import getValue_changeEvent :: ChangeEventData -> String

instance getValue_ChangeEventData :: GetValue ChangeEventData where
  getValue :: ChangeEventData -> String
  getValue = getValue_changeEvent
