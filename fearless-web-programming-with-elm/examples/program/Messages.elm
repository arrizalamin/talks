module Messages exposing (..)

import Time


type Msg
    = Input String
    | GenerateId
    | AddTask Float
    | Toggle Float Bool
    | SetTime Time.Time
    | Tick Time.Time
