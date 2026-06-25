#!/usr/bin/env bash
set -e

python3 -m http.server 8000 -d build &
serverpid=$!
trap "kill $serverpid" EXIT

while inotifywait -r -e modify,create,delete,move site
do
    ./framework build site/ build/
done

wait $serverpid
