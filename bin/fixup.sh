#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Invalid number of arguments" >&2;
  echo "Usage: fixups.sh moddirectory" >&2;
  exit 1;
fi

MOD_DIR=$1

COUNTRIES="${MOD_DIR}/history/countries"
for COUNTRY_FILE in "${COUNTRIES}"/*; do
  sed -ie 's/technology_group = nomad/technology_group = nomad_group/g' "$COUNTRY_FILE"
done 
