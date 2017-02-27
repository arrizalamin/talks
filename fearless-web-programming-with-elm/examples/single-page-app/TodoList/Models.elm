module TodoList.Models exposing (..)

import AppModel.Models exposing (Project)


type alias Todo =
    { id : Float
    , text : String
    , project : Project
    , completed : Bool
    }


type alias Model =
    { todos : List Todo
    , input : String
    }
