module AppModel.Models exposing (..)

import Time


type Project
    = Personal
    | Work
    | Shopping


type alias AppModel =
    { currentTime : Time.Time
    , project : Project
    }
