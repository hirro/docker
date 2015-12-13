#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/setenv.sh"

for path in $DIR/../build/images.d/*; do
	echo "Building $path"
	( cd $path && ./build.sh )
done