#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/setenv.sh"

for path in $PWD/images.d/*; do
	echo
	echo
	echo "Building $path"
	( cd $path && ./build.sh )
done