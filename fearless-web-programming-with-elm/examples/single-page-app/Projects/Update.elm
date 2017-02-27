module Projects.Update exposing (..)

import Projects.Messages exposing (Msg(..))
import AppModel.Messages exposing (AppModelMsg(..))
import AppModel.Models exposing (AppModel)


update : Msg -> AppModel -> ( Cmd Msg, AppModelMsg )
update msg appModel =
    case msg of
        SelectProject project ->
            ( Cmd.none, SetProject project )
