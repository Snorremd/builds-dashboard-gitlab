module Main exposing (..)

import Html.App
import Messages exposing (Msg)
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Subscriptions exposing (subscriptions)
import Builds.Commands exposing (fetchAll)

init : ( Model, Cmd Msg )
init =
  (initialModel
  , Cmd.map Messages.BuildsMsg (fetchAll initialModel.gitlabUrl initialModel.projectId initialModel.gitlabToken))

-- MAIN
main : Program Never
main =
  Html.App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

