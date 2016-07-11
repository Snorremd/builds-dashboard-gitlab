module Builds.Models exposing (..)

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
  , commit : Commit }

new : Build
new =
  { id = 0
  , name = "Some name"
  , stage = "Some stage"
  , ref = "Some branch"
  , status = "Status"
  , commit = { shortId = "0ff3ae19"
             , title = "Some commit title"
             , message = "Some commit message"
             , authorName = "Some author"
             }
  }

