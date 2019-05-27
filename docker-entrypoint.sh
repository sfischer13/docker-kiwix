#!/usr/bin/env bash

set -e -o pipefail

if [ $# -eq 0 ]; then
    # run server if there are .zim files
    if compgen -G "$DATA/*.zim" > /dev/null; then
        exec kiwix-serve --port 8080 "$DATA"/*.zim
    else
        echo "NO .zim FILES WERE FOUND!"
        exit 1
    fi
fi

exec "$@"
