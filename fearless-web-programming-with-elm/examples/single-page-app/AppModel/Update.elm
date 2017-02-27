module AppModel.Update exposing (..)

import AppModel.Models exposing (AppModel)
import AppModel.Messages exposing (AppModelMsg(..))
import Time


update : AppModelMsg -> AppModel -> ( AppModel, Cmd AppModelMsg )
update msg model =
    case msg of
        NoUpdate ->
            ( model, Cmd.none )

        Tick _ ->
            let
                nextTime =
                    model.currentTime + Time.second
            in
                ( { model | currentTime = nextTime }, Cmd.none )

        SetProject project ->
            ( { model | project = project }, Cmd.none )
