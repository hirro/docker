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
YO_WORKTAJM_PATH=../../../../yo-worktajm/
if [ -d "$YO_WORKTAJM_PATH/dist" ] && [ -d "$YO_WORKTAJM_PATH/node_modules" ]; then
	cp -r $YO_WORKTAJM_PATH/dist dist
	cp -r $YO_WORKTAJM_PATH/node_modules node_modules
	docker build -t worktajm-node .
	rm -rf dist
	rm -rf node_modules
else
	echo "Path $YO_WORKTAJM_PATH does not exist or project has not been built"
	exit 0
fi

# Store 
docker tag -f worktajm-node $DOCKER_REGISTRY/worktajm-node
docker push $DOCKER_REGISTRY/worktajm-node

