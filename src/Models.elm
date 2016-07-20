
module Models exposing (..)

import Builds.Models exposing (Build)
import Settings.Models exposing (Settings)
import Routing

type alias Model =
  { route : Routing.Route
  , settings : Settings
  , builds : List Build }

initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , settings = { gitlabUrl = ""
                 , gitlabToken = "yourtoken"
                 , projectId =  "1"}
    , builds = []
    }