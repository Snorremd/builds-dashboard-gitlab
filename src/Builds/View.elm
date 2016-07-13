module Builds.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Builds.Messages exposing (..)
import Builds.Models exposing (Build)

view : List Build -> Html Msg
view builds =
    table [ class "table" ]
          [ thead []
                  [ tr []
                       [ th [] [ text "Status" ]
                       , th [] [ text "Commit" ]
                       , th [] [ text "Ref" ]
                       , th [] [ text "Name" ]
                       , th [] [ text "Finished" ]
                       , th [] [ text "Commit title" ]]]
          , tbody []
                  (List.map viewBuild builds) ]


viewBuild : Build -> Html Msg
viewBuild build =
  tr [class ("alert " ++ alertClass build.status)]
     [ td [] [ text build.status ]
     , td [] [ text build.commit.shortId ]
     , td [] [ text build.ref ]
     , td [] [ text build.name ]
     , td [] [ text (case build.finishedAt of -- TODO: Write date handling!
                       Nothing -> ""
                       Just val -> toString val) ]
     , td [] [ text build.commit.title ]]

  
alertClass : String -> String
alertClass status =
  case status of
    "success" -> "alert-success"
    "failed" -> "alert-danger"
    "canceled" -> "alert-canceled"
    "pending" -> "alert-warning"
    _ -> "alert-info"