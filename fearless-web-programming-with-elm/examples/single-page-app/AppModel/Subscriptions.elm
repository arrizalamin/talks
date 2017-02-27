module AppModel.Subscriptions exposing (..)

import Time
import AppModel.Models exposing (AppModel)
import AppModel.Messages exposing (AppModelMsg(..))


subscriptions : AppModel -> Sub AppModelMsg
subscriptions model =
    Sub.batch
        [ tick model
        ]


tick : AppModel -> Sub AppModelMsg
tick model =
    Time.every Time.second Tick
