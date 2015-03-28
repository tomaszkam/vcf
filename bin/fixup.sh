#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Invalid number of arguments" >&2;
  echo "Usage: fixups.sh moddirectory" >&2;
  exit 1;
fi

MOD_DIR=$1

LOCALISATION="${MOD_DIR}/localisation"
iconv -f ISO-8859-14 -t UTF-8 \
  "${LOCALISATION}/converted_countries_l_english.yml"\
  > "${LOCALISATION}/converted_countries_l_english.yml.bak"
mv "${LOCALISATION}/converted_countries_l_english.yml.bak"\
   "${LOCALISATION}/converted_countries_l_english.yml"

COUNTRIES="${MOD_DIR}/history/countries"
for COUNTRY_FILE in "${COUNTRIES}"/*; do
  sed -ie 's/technology_group = nomad/technology_group = nomad_group/g' "$COUNTRY_FILE"
done 
