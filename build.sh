#!/bin/bash

for path in $PWD/images.d/*; do
	echo
	echo
	echo "Building $path"
	( cd $path && ./build.sh )
done