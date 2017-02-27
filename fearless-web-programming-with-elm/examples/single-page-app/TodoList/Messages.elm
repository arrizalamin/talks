module TodoList.Messages exposing (..)


type Msg
    = Input String
    | GenerateId
    | AddTask Float
    | Toggle Float Bool
