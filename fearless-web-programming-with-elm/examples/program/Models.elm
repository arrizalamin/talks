module Models exposing (..)

import Time


type alias Todo =
    { id : Float
    , text : String
    , completed : Bool
    }


type AppState
    = NotReady
    | Ready Time.Time


type alias Model =
    { todos : List Todo
    , input : String
    , state : AppState
    }
