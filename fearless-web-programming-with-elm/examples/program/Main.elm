module Main exposing (..)

import Html exposing (program)
import Time
import Task
import Messages exposing (Msg(..))
import Models exposing (Model, AppState(..))
import View exposing (view)
import Update exposing (update)
import Subscriptions exposing (subscriptions)


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init : ( Model, Cmd Msg )
init =
    let
        model =
            Model [] "" NotReady
    in
        ( model, Task.perform SetTime Time.now )
