module TodoList.Init exposing (..)

import TodoList.Models exposing (Model)
import TodoList.Messages exposing (Msg(..))


init : ( Model, Cmd Msg )
init =
    let
        model =
            Model [] ""
    in
        ( model, Cmd.none )
