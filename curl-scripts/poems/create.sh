#!/bin/bash

API="http://localhost:4741"
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
