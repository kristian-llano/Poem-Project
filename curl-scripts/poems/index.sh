#!/bin/sh

API="https://radiant-waters-81924.herokuapp.com"
URL_PATH="/poems"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \

echo

# TOKEN=ceb4d23e081729d3748fd1541bdb8429
