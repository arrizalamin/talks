module Models exposing (..)

import Navigation exposing (Location)
import Routing.Models as RModels
import AppModel.Models exposing (AppModel)


type AppState
    = NotReady
    | Ready AppModel


type alias Model =
    { location : Location
    , state : AppState
    , routeModel : RModels.Model
    }
