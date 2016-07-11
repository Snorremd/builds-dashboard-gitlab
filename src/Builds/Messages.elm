module Builds.Messages exposing (..)

import Http
import Builds.Models exposing (BuildId, Build)

type Msg
    = FetchAllDone (List Build)
    | FetchAllFail Http.Error