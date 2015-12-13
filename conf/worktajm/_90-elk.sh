#!/bin/bash -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../../bin/setenv.sh"

docker pull $DOCKER_REGISTRY/worktajm-ogstash-elk

docker run --name logstash -d \
	-p 8080:80 \
	worktajm-elk
