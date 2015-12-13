#!/bin/bash
DOCKER_REGISTRY=zuul:5000

for path in $PWD/build/images.d/*; do
	echo
	echo
	echo "Building $path"
	( cd $path && ./build.sh )
done