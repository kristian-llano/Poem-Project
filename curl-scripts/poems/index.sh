#!/bin/sh

API="https://git.heroku.com/radiant-waters-81924.git"
URL_PATH="/poems"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo

# TOKEN=ceb4d23e081729d3748fd1541bdb8429
