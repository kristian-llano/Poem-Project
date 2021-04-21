#!/bin/sh

API="http://localhost:4741"
URL_PATH="/poems"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=ceb4d23e081729d3748fd1541bdb8429
