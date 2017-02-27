module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = (Model [] "")
        , update = update
        , view = view
        }


type Msg
    = Input String
    | AddTask
    | Toggle String Bool


type alias Todo =
    { text : String
    , completed : Bool
    }


type alias Model =
    { todos : List Todo
    , input : String
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input text ->
            { model | input = text }

        AddTask ->
            { model
                | input = ""
                , todos = Todo model.input False :: model.todos
            }

        Toggle text checked ->
            let
                nextTodos =
                    List.map
                        (\task ->
                            if task.text == text then
                                { task | completed = checked }
                            else
                                task
                        )
                        model.todos
            in
                { model | todos = nextTodos }


view : Model -> Html Msg
view model =
    div [ class "container bg-light-red near-white border-box pa2" ]
        [ div [ class "cf" ]
            [ div [ class "fl w-80 ph1 " ]
                [ input
                    [ type_ "text"
                    , class "input-reset no-outline ph1 w-100 bg-light-red near-white bw1 bt-0 bl-0 br-0 b--near-white"
                    , value model.input
                    , onInput Input
                    ]
                    []
                ]
            , div [ class "fl w-20 ph1 " ]
                [ button [ class "input-reset no-outline pv1 w-100 f6 ph2 br2 bn bg-dark-red white", onClick AddTask ] [ text "Add Task" ]
                ]
            ]
        , ul [ class "list ph3" ] (List.map viewTask model.todos)
        ]


viewTask : Todo -> Html Msg
viewTask todo =
    let
        todoClassNames =
            "todo b--near-white lh-copy"

        classNames =
            if todo.completed then
                todoClassNames ++ " checked"
            else
                todoClassNames
    in
        li [ class classNames ]
            [ label [ class "db" ]
                [ input [ type_ "checkbox", class "dn", checked todo.completed, onCheck <| Toggle todo.text ] []
                , text todo.text
                ]
            ]
