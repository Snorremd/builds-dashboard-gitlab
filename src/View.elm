
module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Builds.View
import Settings.View
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div []
        [ navbar 
        , content model ]

content : Model -> Html Msg
content model =
    div [ class "container-fluid" ]
        [ page model ]

page : Model -> Html Msg
page model =
  case model.route of
    SettingsRoute ->
      Html.App.map SettingsMsg (Settings.View.view model.settings)
    
    BuildsRoute ->
      Html.App.map BuildsMsg (Builds.View.view model.builds)
    
    NotFoundRoute ->
      notFoundView


navbar : Html Msg
navbar =
    nav [ class "navbar navbar-light bg-faded" ]
        [ a [ class "navbar-brand"
            , href "#" ]
            [ text "Builds Dashboard" ]
        , ul [ class "nav navbar-nav"]
            [ li [ class "nav-item"
                 , onClick ShowBuilds ]
                 [ text "Builds" ]
            , li [ class "nav-item"
                 , onClick ShowSettings ]
                 [ i [ class "fa fa-cog" ]
                    []]
            , li [ class "nav-item" ]
                [ i [ class "fa fa-refresh"
                    , onClick RefreshBuilds ]
                    []]]]

settingsStyle : Bool -> List (String, String)
settingsStyle displaySettings =
  if displaySettings
  then []
  else [("display", "none")]

notFoundView : Html Msg
notFoundView =
  div []
      [ text "Not Found" ]