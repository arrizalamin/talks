module AppModel.Messages exposing (..)

import Time
import AppModel.Models exposing (Project)


type AppModelMsg
    = NoUpdate
    | Tick Time.Time
    | SetProject Project
