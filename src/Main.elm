module Main exposing (..)

import Navigation
import Routing exposing (Route)
import Messages exposing (Msg)
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Subscriptions exposing (subscriptions)

init : Result String Route -> ( Model, Cmd Msg )
init result =
  let
    currentRoute =
      Routing.routeFromResult result
  in
    ( initialModel currentRoute, Cmd.none)

urlUpdate : Result String Route -> Model -> ( Model, Cmd Msg )
urlUpdate result model =
  let
    currentRoute =
      Routing.routeFromResult result
  in
    ( { model | route = currentRoute }, Cmd.none )

-- MAIN
main : Program Never
main =
  Navigation.program Routing.parser
    { init = init
    , view = view
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = subscriptions
    }

