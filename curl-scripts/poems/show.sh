#!/bin/sh

API="https://radiant-waters-81924.herokuapp.com"
URL_PATH="/poems"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=ceb4d23e081729d3748fd1541bdb8429 ID="60807869e129fe3b7456847c" sh curl-scripts/poems/show.sh
