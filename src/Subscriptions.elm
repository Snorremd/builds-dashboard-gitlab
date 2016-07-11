module Subscriptions exposing (..)

import Time exposing (Time, minute)

import Models exposing (Model)
import Messages exposing (Msg)

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every minute Messages.Tick