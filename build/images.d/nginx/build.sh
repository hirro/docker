#!/bin/bash -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../../../bin/setenv.sh"

echo "Building image"
docker build -t worktajm-nginx .
echo "Tagging image: [$DOCKER_REGISTRY]"
docker tag -f worktajm-nginx $DOCKER_REGISTRY/worktajm-nginx
echo "Pushing image: [$DOCKER_REGISTRY]"
docker push $DOCKER_REGISTRY/worktajm-nginx
# docker push $DOCKER_REGISTRY $DOCKER_REGISTRY/worktajm-nginx
