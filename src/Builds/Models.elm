module Builds.Models exposing (..)

import Date exposing (..)

type alias BuildId =
  Int

type alias Commit =
  { shortId : String
  , title : String
  , message : String
  , authorName : String }

type alias Build =
  { id : BuildId
  , name : String -- Build name
  , stage : String -- Build stage
  , ref : String -- Branch name (or tag?)
  , status : String -- success || failed || canceled || pending
  , finishedAt : Maybe Date
  , commit : Commit }
