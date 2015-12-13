#!/bin/bash -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../../bin/setenv.sh"

docker pull $DOCKER_REGISTRY/worktajm-elasticsearch

docker run -d \
    --name elasticsearch \
    -p 9200:9200 \
    -p 9300:9300 \
    worktajm-elasticsearch
