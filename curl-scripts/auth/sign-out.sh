#!/bin/bash

API="https://git.heroku.com/radiant-waters-81924.git"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
