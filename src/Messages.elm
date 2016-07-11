module Messages exposing (..)

import Time exposing (Time)
import Builds.Messages

type Msg
    = BuildsMsg Builds.Messages.Msg
    | Tick Time