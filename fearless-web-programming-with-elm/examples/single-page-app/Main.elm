module Main exposing (..)

import Navigation exposing (program, Location)
import Time
import Task
import Messages exposing (Msg(..))
import Models exposing (Model, AppState(..))
import View exposing (view)
import Update exposing (update)
import Subscriptions exposing (subscriptions)
import Routing.Init as RouterInit


main : Program Never Model Msg
main =
    program UrlChange
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        ( routeModel, routeCmd ) =
            RouterInit.init location

        model =
            Model location NotReady routeModel

        cmd =
            Cmd.batch
                [ Task.perform SetTime Time.now
                , Cmd.map RouterMsg routeCmd
                ]
    in
        ( model, cmd )
