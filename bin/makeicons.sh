#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

FOLDER="./static/images"
IMAGE="red-logo-512.png"
OUTPUT="./static/images"

command -v docker >/dev/null 2>&1 || {
  fail "Docker is NOT installed!"
}

if [ -f "$FOLDER/$IMAGE" ]; then
  SIZES=(16 24 29 32 40 48 57 58 60 64 70 72 76 80 87 96 114 120 128 144 150 152 167 180 192 196 256 310 320 512)
  for size in ${SIZES[@]}; do
    docker run --name imagick --rm -v "$PWD":/tmp -w /tmp gscloudcz/imagick convert -flatten -background none \
        -resize ${size}x${size} "$FOLDER/$IMAGE" $OUTPUT/favicon-${size}.png
    if [ -f "$OUTPUT/favicon-${size}.png" ]; then
      echo -ne "\e[0mconverting square: \e[92m$size px\e[0m\033[0K\r"
    else
      fail "ERROR: Could not process input file $IMAGE"
    fi
  done
else
  fail "ERROR: Input file $IMAGE does not exist."
fi

echo -en "\n\nDone.\n"

exit 0
