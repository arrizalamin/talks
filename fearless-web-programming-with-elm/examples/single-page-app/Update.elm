module Update exposing (update)

import Task
import Messages exposing (Msg(..))
import Models exposing (Model, AppState(..))
import Routing.Update as RUpdate
import Routing.Messages as RMsg
import AppModel.Update as AppModelUpdate
import AppModel.Init as AppModelInit


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                cmd =
                    Task.perform RMsg.UpdateRoute (Task.succeed location)
            in
                ( model, Cmd.map RouterMsg cmd )

        RouterMsg subMsg ->
            case model.state of
                NotReady ->
                    ( model, Cmd.none )

                Ready appModel ->
                    let
                        ( nextRouteModel, routeCmd, appModelMsg ) =
                            RUpdate.update subMsg appModel model.routeModel

                        ( nextAppModel, appCmd ) =
                            AppModelUpdate.update appModelMsg appModel

                        cmd =
                            Cmd.batch
                                [ Cmd.map RouterMsg routeCmd
                                , Cmd.map AppModelMsg appCmd
                                ]
                    in
                        ( { model
                            | routeModel = nextRouteModel
                            , state = Ready nextAppModel
                          }
                        , cmd
                        )

        SetTime t ->
            let
                ( appModel, cmd ) =
                    AppModelInit.init t
            in
                ( { model | state = Ready appModel }, Cmd.map AppModelMsg cmd )

        AppModelMsg subMsg ->
            case model.state of
                Ready appModel ->
                    let
                        ( nextAppModel, cmd ) =
                            AppModelUpdate.update subMsg appModel
                    in
                        ( { model | state = Ready nextAppModel }, Cmd.map AppModelMsg cmd )

                NotReady ->
                    ( model, Cmd.none )
