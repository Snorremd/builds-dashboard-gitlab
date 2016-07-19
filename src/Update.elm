module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Builds.Update
import Builds.Commands exposing (fetchAll)
import Settings.Updates

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            (model, Cmd.map Messages.BuildsMsg (fetchAll model.settings.gitlabUrl model.settings.projectId model.settings.gitlabToken))
        ToggleSettings ->
            ( { model | settingsVisible = not model.settingsVisible }, Cmd.none )
        RefreshBuilds ->
            (model, Cmd.map Messages.BuildsMsg (fetchAll model.settings.gitlabUrl model.settings.projectId model.settings.gitlabToken))
        BuildsMsg subMsg ->
            let
                ( updatedBuilds, cmd ) =
                    Builds.Update.update subMsg model.builds
            in
                ( { model | builds = updatedBuilds }, Cmd.map BuildsMsg cmd )
        SettingsMsg subMsg ->
           let
               updatedSettings =
                   Settings.Updates.update subMsg  model.settings
           in
               ( {model | settings = updatedSettings }, Cmd.none )