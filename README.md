# OpenChessEngine
This is the beginning of writing an open source chess engine, rules engine, and front end UI for programming experience and fun!

## Frontend
The UI for this project is using [Chessboard.js](https://www.chessboardjs.com/), a JavaScript/HTML/CSS pack for a basic chessboard with API endpoints to connect to a back end.

## Installation
The frontend and backend are packaged through the added Dockerfile, so make sure that the chessboard.js components are loaded in the frontend folder, and build the image with the following:
```
$ docker build -t chess-engine-ui .
```
After the image is built, you need to supply a port for the container and run the container with the following:
```
$ docker run --name chess-ui -d -p 8080:80 chess-engine-ui
```
