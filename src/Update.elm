module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Builds.Update
import Builds.Commands exposing (fetchAll)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            (model, Cmd.map Messages.BuildsMsg (fetchAll model.gitlabUrl model.projectId model.gitlabToken))
        BuildsMsg subMsg ->
            let
                ( updatedBuilds, cmd ) =
                    Builds.Update.update subMsg model.builds
            in
                ( { model | builds = updatedBuilds }, Cmd.map BuildsMsg cmd )