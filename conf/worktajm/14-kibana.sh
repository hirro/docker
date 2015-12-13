#!/bin/bash -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/../../bin/setenv.sh"

docker pull $DOCKER_REGISTRY/worktajm-kibana
docker run --name kibana -d \
	-p 5601:5601 \
	--link elasticsearch:elasticsearch \
	-e ELASTICSEARCH_URL=http://elasticsearch:9200 \
	worktajm-kibana

