module Subscriptions exposing (..)

import Time
import Models exposing (Model, AppState(..))
import Messages exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ tick model
        ]


tick : Model -> Sub Msg
tick model =
    case model.state of
        NotReady ->
            Sub.none

        Ready _ ->
            Time.every Time.second Tick
