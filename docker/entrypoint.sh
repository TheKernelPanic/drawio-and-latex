#!/usr/bin/env bash

set -e

export DISPLAY="${XVFB_DISPLAY}"

Xvfb "${XVFB_DISPLAY}" ${XVFB_OPTIONS} &

rm -f /data/output/*

for FILE_PATH in /data/diagrams/*;
do
  if [ -f "$FILE_PATH" ];
  then
    if [ "${FILE_PATH#*.}" != 'drawio' ];
    then
      continue
    fi
    FILE_NAME=$(basename "$FILE_PATH")
    IMAGE_NAME="${FILE_NAME%%.*}"
    timeout 10s /opt/drawio/drawio -x -f png -o "/data/diagrams/img/$IMAGE_NAME.png" "$FILE_PATH" --no-sandbox
  fi
done

pdflatex -output-directory="/data/output" "$1"