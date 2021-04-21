#!/bin/bash

API="http://localhost:4741"
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
