
module Models exposing (..)

import Builds.Models exposing (Build)
import Settings.Models exposing (Settings)

type alias Model =
  { settingsVisible : Bool
  , settings : Settings
  , builds : List Build }

initialModel : Model
initialModel =
    { settingsVisible = True
    , settings = { gitlabUrl = ""
                 , gitlabToken = "yourtoken"
                 , projectId =  "1"}
    , builds = []
    }