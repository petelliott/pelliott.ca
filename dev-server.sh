#!/usr/bin/env bash

./framework build site/ build/

python3 -m http.server 8000 -d build &
serverpid=$!
trap "kill $serverpid" EXIT

while inotifywait -r -e modify,create,delete,move site shared framework-src/ framework
do
    ./framework build site/ build/
done

wait $serverpid
