module Messages exposing (..)

import Time exposing (Time)
import Builds.Messages
import Settings.Messages

type Msg
    = BuildsMsg Builds.Messages.Msg
    | SettingsMsg Settings.Messages.Msg
    | RefreshBuilds
    | Tick Time
    | ShowBuilds
    | ShowSettings