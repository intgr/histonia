#!/bin/sh
DOCKER_BUILDKIT=1 docker build -t histonia .
docker run -it --rm --name=histonia -p 127.0.0.1:8080:8080 histonia

