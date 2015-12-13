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
docker build -t worktajm-elasticsearch .

# Store 
docker tag -f worktajm-elasticsearch  $DOCKER_REGISTRY/worktajm-elasticsearch 
docker push $DOCKER_REGISTRY/worktajm-elasticsearch 



