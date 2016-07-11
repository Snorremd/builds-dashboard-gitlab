module Builds.Update exposing (..)


import Builds.Messages exposing (Msg(..))
import Builds.Models exposing (Build)

update : Msg -> List Build -> ( List Build, Cmd Msg )
update message builds =
    case message of
        FetchAllDone newBuilds ->
            ( newBuilds, Cmd.none )

        FetchAllFail error ->
            ( builds, Cmd.none )