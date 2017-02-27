module AppModel.Init exposing (..)

import AppModel.Models exposing (AppModel, Project(..))
import AppModel.Messages exposing (AppModelMsg(..))
import Time


init : Time.Time -> ( AppModel, Cmd AppModelMsg )
init time =
    let
        model =
            AppModel time Personal
    in
        ( model, Cmd.none )
