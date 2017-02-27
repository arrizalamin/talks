module Projects.Views exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import AppModel.Models exposing (AppModel, Project(..))
import Projects.Messages exposing (Msg(..))


view : AppModel -> Html Msg
view appModel =
    div []
        [ p [ class "mv2 tc" ] [ a [ href "#/", class "link near-white hover-dark-red" ] [ text "Back to Todo List" ] ]
        , button_ appModel Personal
        , button_ appModel Work
        , button_ appModel Shopping
        ]


button_ : AppModel -> Project -> Html Msg
button_ appModel project =
    let
        buttonClassNames =
            "input-reset no-outline bn near-white bg-dark-red mv1 f6 pv1 block w-100"

        classNames =
            if appModel.project == project then
                buttonClassNames ++ " bg-dark-green"
            else
                buttonClassNames
    in
        button [ class classNames, onClick (SelectProject project) ] [ text (toString project) ]
