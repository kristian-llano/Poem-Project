#!/bin/bash

API="https://radiant-waters-81924.herokuapp.com"
URL_PATH="/poems"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "poem": {
      "title": "'"${TITLE}"'",
      "body": "'"${TEXT}"'"
    }
  }'

echo
