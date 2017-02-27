module TodoList.Update exposing (..)

import Random
import TodoList.Messages exposing (Msg(..))
import TodoList.Models exposing (Model, Todo)
import AppModel.Messages exposing (AppModelMsg(..))
import AppModel.Models exposing (AppModel)


update : Msg -> AppModel -> Model -> ( Model, Cmd Msg, AppModelMsg )
update msg appModel model =
    case msg of
        Input text ->
            ( { model | input = text }, Cmd.none, NoUpdate )

        GenerateId ->
            if model.input == "" then
                ( model, Cmd.none, NoUpdate )
            else
                ( model, Random.generate AddTask <| Random.float 0 1, NoUpdate )

        AddTask id ->
            let
                nextModel =
                    { model
                        | input = ""
                        , todos = Todo id model.input appModel.project False :: model.todos
                    }
            in
                ( nextModel, Cmd.none, NoUpdate )

        Toggle id checked ->
            let
                nextTodos =
                    List.map
                        (\task ->
                            if task.id == id then
                                { task | completed = checked }
                            else
                                task
                        )
                        model.todos
            in
                ( { model | todos = nextTodos }, Cmd.none, NoUpdate )
