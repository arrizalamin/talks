module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (Model, AppState(..), Todo)
import Messages exposing (Msg(..))
import Time
import Date


view : Model -> Html Msg
view model =
    case model.state of
        NotReady ->
            div [] [ text "Loading" ]

        Ready time ->
            div [ class "container bg-light-red near-white border-box pa2" ]
                [ p [ class "ph1 tc" ] [ printTime time ]
                , div [ class "cf" ]
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
                        [ button [ class "input-reset no-outline pv1 w-100 f6 ph2 br2 bn bg-dark-red white", onClick GenerateId ] [ text "Add Task" ]
                        ]
                    ]
                , ul [ class "list ph3" ] (List.map viewTask model.todos)
                ]


printTime : Time.Time -> Html Msg
printTime time =
    let
        date =
            Date.fromTime time

        hour =
            toString (Date.hour date)

        minute =
            toString (Date.minute date)

        second =
            toString (Date.second date)
    in
        text <| "Current Time: " ++ hour ++ ":" ++ minute ++ ":" ++ second


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
                [ input [ type_ "checkbox", class "dn", checked todo.completed, onCheck <| Toggle todo.id ] []
                , text todo.text
                ]
            ]
