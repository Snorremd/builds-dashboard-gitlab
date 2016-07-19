
module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Builds.View
import Settings.View

view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    div [ class "container-fluid" ]
        [ navbar
        , div [style (settingsStyle model.settingsVisible)] [Html.App.map SettingsMsg (Settings.View.view model.settings)]
        , Html.App.map BuildsMsg (Builds.View.view model.builds)]


navbar : Html Msg
navbar =
    nav [ class "navbar navbar-light bg-faded" ]
        [ a [ class "navbar-brand"
            , href "#" ]
            [ text "Builds Dashboard" ]
        , ul [ class "nav navbar-nav"]
            [ li [ class "nav-item" ]
                [ i [ class "fa fa-cog"
                    , onClick ToggleSettings ]
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