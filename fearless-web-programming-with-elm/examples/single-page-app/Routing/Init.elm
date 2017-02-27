module Routing.Init exposing (..)

import Navigation exposing (Location)
import Routing.Route exposing (parseRoute)
import Routing.Models exposing (Model)
import Routing.Messages exposing (Msg(..))


-- Route Inits

import TodoList.Init as TLInit


init : Location -> ( Model, Cmd Msg )
init location =
    let
        route =
            parseRoute location

        ( todoListModel, todoListCmd ) =
            TLInit.init

        model =
            Model route todoListModel

        cmd =
            Cmd.batch
                [ Cmd.map TodoListMsg todoListCmd
                ]
    in
        ( model, cmd )
