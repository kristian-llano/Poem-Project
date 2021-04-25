#!/bin/bash

API="https://radiant-waters-81924.herokuapp.com"
URL_PATH="/poems"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}" \


echo
