
module Models exposing (..)

import Builds.Models exposing (Build)

type alias Model =
  { gitlabUrl : String
  , gitlabToken : String
  , projectId : String
  , builds : List Build }

initialModel : Model
initialModel =
    { gitlabUrl = "https://gitlab.example"
    , gitlabToken = "yourtoken"
    , projectId =  "1"
    , builds = []
    }