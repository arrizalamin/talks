module Routing.Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Routing.Models exposing (Model)
import Routing.Messages exposing (Msg(..))
import Routing.Route exposing (Route(..))
import AppModel.Models exposing (AppModel)


-- Route View

import TodoList.Views as TLView
import Projects.Views as ProjView


layout : Html msg -> Html msg
layout children =
    div [ class "container bg-light-red near-white border-box pa2" ] [ children ]


view : AppModel -> Model -> Html Msg
view appModel model =
    case model.route of
        NotFoundRoute ->
            div [] [ text "Not Found" ]

        TodoListRoute ->
            layout <| Html.map TodoListMsg <| TLView.view appModel model.todoListModel

        ProjectsRoute ->
            layout <| Html.map ProjectsMsg <| ProjView.view appModel
