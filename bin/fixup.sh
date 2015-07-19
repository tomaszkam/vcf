#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Invalid number of arguments" >&2;
  echo "Usage: fixups.sh moddirectory" >&2;
  exit 1;
fi

MOD_DIR=$1

LOCALISATIONS="${MOD_DIR}/localisation"
for LOCALISATION_FILE in "${LOCALISATIONS}"/*; do
  sed -ie 's/^^ï»¿//g' "$LOCALISATION_FILE"
done 
