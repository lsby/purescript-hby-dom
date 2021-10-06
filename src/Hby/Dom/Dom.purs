module Hby.Dom.Dom where

import Prelude
import Effect (Effect)

-- onLoad
foreign import onLoad :: forall a. Effect a -> Effect Unit

-- setBodyHtml
foreign import setBodyHtml :: String -> Effect Unit
