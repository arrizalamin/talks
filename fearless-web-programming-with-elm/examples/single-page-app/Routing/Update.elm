module Routing.Update exposing (update)

import Routing.Route exposing (parseRoute)
import Routing.Models exposing (Model)
import Routing.Messages exposing (Msg(..))
import AppModel.Messages exposing (AppModelMsg(..))
import AppModel.Models exposing (AppModel)


-- Route Updates

import TodoList.Update as TodoListUpdate
import Projects.Update as ProjectsUpdate


update : Msg -> AppModel -> Model -> ( Model, Cmd Msg, AppModelMsg )
update msg appModel model =
    case msg of
        UpdateRoute location ->
            ( { model | route = parseRoute location }, Cmd.none, NoUpdate )

        TodoListMsg subMsg ->
            let
                ( nextTodoListModel, cmd, appModelMsg ) =
                    TodoListUpdate.update subMsg appModel model.todoListModel
            in
                ( { model | todoListModel = nextTodoListModel }, Cmd.map TodoListMsg cmd, appModelMsg )

        ProjectsMsg subMsg ->
            let
                ( cmd, appModelMsg ) =
                    ProjectsUpdate.update subMsg appModel
            in
                ( model, Cmd.map ProjectsMsg cmd, appModelMsg )
