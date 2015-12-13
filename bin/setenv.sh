#!/bin/bash -e

OS=`uname -s`
if [ $OS = 'Darwin' ]; then
	# Boot2docker doesn't like my working certificates
	export DOCKER_REGISTRY=192.168.1.2:5000
	docker ps
elif [[ $OS = 'Linux' ]]; then
	export DOCKER_REGISTRY=worktajm.com:5000
else
	echo "Failed to find matching DOCKER_REGISTRY for os [$OS]"
	exit 0
fi

echo "Using DOCKER_REGISTRY [$DOCKER_REGISTRY]"

