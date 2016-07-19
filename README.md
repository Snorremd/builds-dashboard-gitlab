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

Basically you can only run it in development mode as of now. Run with:

```bash
npm install
npm run dev
```

Open [localhost:3000](http://localhost:3000). You should see a settings form.
Enter your root Gitlab URL (e.g. https://example.com), token, and a project
ID. If you click the small refresh icon in the navigation bar you should
hopefully see a list of builds! You may hide the settings form by clicking the
settings icon.

The build list will automatically refresh once a minute. You can at any time
change the project ID or other settings in the settings form. Currently only
one project may be specified at a time. Note that the settings are not saved
between refreshes!

Todo:

    - Store Gitlab settings between refreshes.
    - Add support for fetching builds from multiple projects
    - Create project view to toggle which projects to fetch builds for
    - Create trends view