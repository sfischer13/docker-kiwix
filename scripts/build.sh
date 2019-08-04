#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	VERSION=2.1.0
elif [ $# -eq 1 ]; then
	VERSION="$1"
else
	echo "Wrong number of arguments!"
	exit 1
fi

docker build \
--no-cache \
--pull \
--rm \
--target kiwix \
--tag sfischer13/kiwix:"$VERSION" \
--build-arg VERSION="$VERSION" \
.

docker image prune --force
