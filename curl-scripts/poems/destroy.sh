#!/bin/bash

API="https://git.heroku.com/radiant-waters-81924.git"
URL_PATH="/poems"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}" \


echo
