module Messages exposing (..)

import Navigation exposing (Location)
import Time
import Routing.Messages
import AppModel.Messages


type Msg
    = UrlChange Location
    | RouterMsg Routing.Messages.Msg
    | AppModelMsg AppModel.Messages.AppModelMsg
    | SetTime Time.Time
