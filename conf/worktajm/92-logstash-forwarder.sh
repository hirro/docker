#!/bin/bash -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../../bin/setenv.sh"

docker pull $DOCKER_REGISTRY/worktajm-ogstash-forwarder

docker run --name logstash-forwarder \
	-d \
	--link logstash:logstash \
	--volumes-from nginx \
	worktajm-logstash-forwarder

