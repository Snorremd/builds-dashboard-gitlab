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

-- new : Build
-- new =
--   { id = 0
--   , name = "Some name"
--   , stage = "Some stage"
--   , ref = "Some branch"
--   , status = "Status"
--   , finishedAt = Date.fromTime 1468367153
--   , commit = { shortId = "0ff3ae19"
--              , title = "Some commit title"
--              , message = "Some commit message"
--              , authorName = "Some author"
--              }
--   }

