module Routing.Models exposing (..)

import Routing.Route exposing (Route)


-- Route Model

import TodoList.Models as TLModels


type alias Model =
    { route : Route
    , todoListModel : TLModels.Model
    }
