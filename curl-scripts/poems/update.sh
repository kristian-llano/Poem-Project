#!/bin/bash

API="https://git.heroku.com/radiant-waters-81924.git"
URL_PATH="/poems"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "poem": {
      "_id": "'"${ID}"'",
      "title": "'"${TITLE}"'",
      "body": "'"${TEXT}"'"
    }
  }'


echo
