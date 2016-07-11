module Builds.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Task
import Builds.Models exposing (Build, Commit)
import Builds.Messages exposing (..)

fetchAll : String -> String -> String -> Cmd Msg
fetchAll gitlabUrl projectId privateToken =
  Http.send Http.defaultSettings 
    { verb = "GET"
    , headers = [ ("PRIVATE-TOKEN", privateToken) ]
    , url = gitlabUrl ++ "/api/v3/projects/" ++ projectId ++ "/builds"
    , body = Http.empty }
  |> Http.fromJson collectionDecoder
  |> Task.perform FetchAllFail FetchAllDone

collectionDecoder : Decode.Decoder (List Build)
collectionDecoder =
  Decode.list buildDecoder

buildDecoder : Decode.Decoder Build
buildDecoder =
  Decode.object6 Build
    ("id" := Decode.int)
    ("name" := Decode.string)
    ("stage" := Decode.string)
    ("ref" := Decode.string)
    ("status" := Decode.string)
    ("commit" :=  commitDecoder)

commitDecoder : Decode.Decoder Commit
commitDecoder =
  Decode.object4 Commit
    ("short_id" := Decode.string)
    ("title" := Decode.string)
    ("message" := Decode.string)
    ("author_name" := Decode.string)