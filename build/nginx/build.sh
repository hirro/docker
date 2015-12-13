#!/bin/bash -e

# Load prerequisites
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../../bin/setenv.sh"

# Check required variables
if [ -z "$DOCKER_REGISTRY" ]; then
	echo "Variable DOCKER_REGISTRY not defined"
	exit;
else
	echo "Using DOCKER_REGISTRY [$DOCKER_REGISTRY]"
fi

# Build image
docker build -t worktajm-nginx .

# Store 
docker tag -f worktajm-nginx $DOCKER_REGISTRY/worktajm-nginx
docker push $DOCKER_REGISTRY/worktajm-nginx
