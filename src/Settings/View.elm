module Settings.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Settings.Messages exposing (..)
import Settings.Models exposing (Settings)

view : Settings -> Html Msg
view settings =
  div [ class "container" ]
      [ Html.form []
                  [ fieldset [ class "form-group" ]
                             [ label [ for "gitlabUrl" ] [ text "Gitlab URL" ]
                             , input [ type' "text"
                                     , class "form-control"
                                     , id "gitlabUrl"
                                     , placeholder "https://gitlab.example.com"
                                     , onInput GitlabUrl ] []]
                  , fieldset [class "form-group" ]
                             [ label [ for "gitlabToken" ] [text "Gitlab Token" ]
                             , input [ type' "password"
                                     , class "form-control"
                                     , id "gitlabToken"
                                     , placeholder "Your Gitlab Token"
                                     , onInput GitlabToken ] []]
                  , fieldset [class "form-group" ]
                             [ label [ for "projectId" ] [text "Gitlab Project ID" ]
                             , input [ type' "text"
                                     , class "form-control"
                                     , id "projectId"
                                     , placeholder "Gitlab Project ID (Integer)"
                                     , onInput ProjectId ] []]]]