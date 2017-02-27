module View exposing (view)

import Html exposing (..)
import Models exposing (Model, AppState(..))
import Messages exposing (Msg(..))
import Routing.Views as RViews


view : Model -> Html Msg
view model =
    case model.state of
        NotReady ->
            div [] [ text "Loading" ]

        Ready appModel ->
            Html.map RouterMsg <| RViews.view appModel model.routeModel
