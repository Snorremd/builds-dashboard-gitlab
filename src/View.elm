
module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Builds.View

view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    div [ class "container-fluid" ]
        [ div [ class "header clearfix" ]
              [ nav []
                    [ h3 [ class "text-muted" ]
                         [ text "Builds" ]]
        , Html.App.map BuildsMsg (Builds.View.view model.builds)]]
    