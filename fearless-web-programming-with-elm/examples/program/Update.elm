module Update exposing (update)

import Random
import Time
import Messages exposing (Msg(..))
import Models exposing (Model, Todo, AppState(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input text ->
            ( { model | input = text }, Cmd.none )

        GenerateId ->
            ( model, Random.generate AddTask <| Random.float 0 1 )

        AddTask id ->
            let
                nextModel =
                    { model
                        | input = ""
                        , todos = Todo id model.input False :: model.todos
                    }
            in
                ( nextModel, Cmd.none )

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
                ( { model | todos = nextTodos }, Cmd.none )

        SetTime t ->
            ( { model | state = Ready t }, Cmd.none )

        Tick _ ->
            let
                time =
                    case model.state of
                        Ready t ->
                            t

                        NotReady ->
                            Time.second

                nextTime =
                    time + Time.second
            in
                ( { model | state = Ready nextTime }, Cmd.none )
