module Routing.Messages exposing (..)

import Navigation exposing (Location)


-- Route Messages

import TodoList.Messages as TLMsg
import Projects.Messages as ProjMsg


type Msg
    = UpdateRoute Location
    | TodoListMsg TLMsg.Msg
    | ProjectsMsg ProjMsg.Msg
