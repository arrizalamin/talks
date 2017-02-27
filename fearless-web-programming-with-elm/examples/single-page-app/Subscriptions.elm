module Subscriptions exposing (..)

import Models exposing (Model, AppState(..))
import Messages exposing (Msg(..))
import AppModel.Subscriptions as AppModelSubscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        appModelSubs =
            case model.state of
                Ready appModel ->
                    Sub.map AppModelMsg <| AppModelSubscriptions.subscriptions appModel

                NotReady ->
                    Sub.none
    in
        Sub.batch
            [ appModelSubs
            ]
