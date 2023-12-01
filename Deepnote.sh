#!/bin/bash

docker pull robotlocomotion/drake:jammy
docker build -f setup/docker/Dockerfile -t russtedrake/manipulation:latest .
docker push russtedrake/manipulation:latest
docker build -f setup/docker/Dockerfile -t russtedrake/manipulation:$(git rev-parse --short HEAD) .
docker push russtedrake/manipulation:$(git rev-parse --short HEAD)
python3 htmlbook/publish_to_deepnote.py $(git rev-parse --short HEAD)
echo "Remember to log on to deepnote and build the dockerfile in any one of the notebooks"
echo "https://deepnote.com/workspace/$(cat Deepnote_workspace.txt)"
