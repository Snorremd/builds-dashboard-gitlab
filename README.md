# builds-dashboard-gitlab

A simple Gitlab builds dashboard for the browser written in Elm.

## Introduction

Builds Dashboard Gitlab is a simple dashboard that shows builds in a web
browser. This is obviously not an official Gitlab project, but is currently
specifically engineered for Gitlab so I chose to include it in the project
name.

The dashboard is written in [Elm](http://elm-lang.org/), a statically typed,
functional, ML-based, compile-to-Javascript language. The project is not ment
to be something fancy, but is rather a small project I can use to learn about
Elm.

## Running

Install Elm ~ 0.17.1 which is the one I've tested it for so far.

Basically you can only run it in development mode as of now. First you need to
manually edit the application model (state) to include the correct Gitlab
http address and token, as well as a project id for which to list builds.
Look in `src/Models.elm` for:

```elm
initialModel =
    { gitlabUrl = "https://gitlab.example"
    , gitlabToken = "yourtoken"
    , projectId =  "1"
    , builds = []
    }
```

Replace values with whatever works for you, then run with:

```bash
npm install
npm run dev
```

Open [localhost:3000](http://localhost:3000). You will hopefully see a list of
builds. The web application will update this list once a minute (currently).