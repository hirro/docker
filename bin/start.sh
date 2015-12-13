#!/bin/bash -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/setenv.sh"

usage() {
	echo
	echo "start.sh"
	echo "========"
	echo "Docker service starter usage" >&2
	echo " -p profile" >&2
	echo " -s service" >&2
} 

while getopts ":p:s:" opt; do
  case $opt in
    p)
      PROFILE=$OPTARG
      ;;
    s)
      SERVICE=$OPTARG
      ;;
    \?)
      usage
      exit 0
      ;;
    :)
      usage
      exit 0
      ;;
  esac
done

if [ -z "$PROFILE" ]; then 
	echo "Error, profile must be defined"
	usage
	exit 0
fi

ENV_FILE="$HOME/.$PROFILE.env"
if [ -e $ENV_FILE ]; then
    echo "Loading environment variables..."
    source $ENV_FILE
else
    echo "Error, environment variable file \"$ENV_FILE\" not found"
    cat $ENV_FILE
    exit 0
fi

PROFILE_PATH=$PWD/conf/$PROFILE
if [ ! -e "$PROFILE_PATH" ]; then
	echo "Profile path $PROFILE does not exist"
	exit 0
fi

for path in $PROFILE_PATH/*; do
	if [[ "$path" =~ /_ ]]; then
		echo "Skipping disabled service: $path"
	else	
		if [ -z "$SERVICE" ]; then
			echo "Starting service $path"
			( cd $PROFILE_PATH && exec $path )
		else
			if [[ "$path" =~ "$SERVICE" ]]; then
				echo "Starting service $SERVICE"
				( cd $PROFILE_PATH && exec $path)			
			fi
		fi		
	fi
done
