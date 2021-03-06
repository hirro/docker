#!/bin/bash -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../../bin/setenv.sh"

docker pull $DOCKER_REGISTRY/worktajm-mongodb

docker run -d \
    --name mongodb \
    -p 27017:27017 \
    -e MONGODB_USERNAME=dbuser \
    -e MONGODB_PASSWORD=dbl33t \
    -e MONGODB_DBNAME=worktajm \
    --volumes-from mongo_data \
    worktajm-mongodb

# Wait for the service to start
sleep 10