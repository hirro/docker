#!/bin/bash -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../../bin/setenv.sh"

docker pull $DOCKER_REGISTRY/worktajm-logstash

docker run -d \
    --name logstash \
    --link elasticsearch:elasticsearch \
    worktajm-logstash \
	logstash --debug -f  /etc/logstash/logstash.conf
