#!/bin/bash
YO_WORKTAJM_PATH=../../../../yo-worktajm/
echo "Using worktajm path $YO_WORKTAJM_PATH"

if [ -d "$YO_WORKTAJM_PATH/dist" ] && [ -d "$YO_WORKTAJM_PATH/node_modules" ]; then
	cp -r $YO_WORKTAJM_PATH/dist dist
	cp -r $YO_WORKTAJM_PATH/node_modules node_modules
	docker build -t worktajm-node .
	rm -rf dist
	rm -rf node_modules
else
	echo "Path $YO_WORKTAJM_PATH does not exist or project has not been built"
fi