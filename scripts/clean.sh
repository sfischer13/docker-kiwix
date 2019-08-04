#!/usr/bin/env bash

docker images --quiet --filter=reference="sfischer13/kiwix:*" | xargs -r docker rmi --force

docker image prune --force
