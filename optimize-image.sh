#!/usr/bin/env bash

for file in "$@"
do
    magick $file -strip -quality 70 -resize 1920x1920\> $file
done
