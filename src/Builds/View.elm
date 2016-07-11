module Builds.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Builds.Messages exposing (..)
import Builds.Models exposing (Build)

view : List Build -> Html Msg
view builds =
    div [] (List.map viewBuild builds)

viewBuild : Build -> Html Msg
viewBuild build =
  div [ class "card card-inverse card-success text-xs" ]
      [ div [ class "card-block" ]
            [ h4 [ class "card-title" ]
                 [ text (build.ref ++ " " ++ build.name ++ " - " ++ build.commit.title)]
            , p  [ class "card-text"]
                 [ text (build.commit.message)]
            , p  [ class "card-text"]
                 [ small [ ]
                         [ text ("Started " ++ build.commit.shortId)]]]]
  
