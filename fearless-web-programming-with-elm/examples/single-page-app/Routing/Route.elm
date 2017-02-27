module Routing.Route exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = NotFoundRoute
    | TodoListRoute
    | ProjectsRoute


route : Parser (Route -> a) a
route =
    oneOf
        [ map TodoListRoute <| top
        , map ProjectsRoute <| s "projects"
        ]


parseRoute : Location -> Route
parseRoute location =
    let
        parsedRoute =
            parseHash route location
    in
        case parsedRoute of
            Nothing ->
                NotFoundRoute

            Just route ->
                route
