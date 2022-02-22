module Hby.Dom.Event where

import Prelude
import Hby.Task (Task)

foreign import onResize :: Task Unit -> Task Unit

foreign import onDOMContentLoaded :: Task Unit -> Task Unit
