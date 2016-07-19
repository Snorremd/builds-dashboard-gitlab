module Settings.Updates exposing (..)

import Settings.Messages exposing (Msg(..))
import Settings.Models exposing (Settings)

update : Msg -> Settings -> Settings
update message settings =
  case message of
    GitlabUrl gitlabUrl ->
      { settings | gitlabUrl = gitlabUrl }
    GitlabToken gitlabToken ->
      { settings | gitlabToken = gitlabToken }
    ProjectId projectId ->
      { settings | projectId = projectId }
