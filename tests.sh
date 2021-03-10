#!/bin/bash

set -Eeuo pipefail

# TODO: move this into Jest + supertest
#ENDPOINT="http://localhost:8080/moneycatcha-dev/us-central1/api/count"
ENDPOINT="https://us-central1-moneycatcha-dev.cloudfunctions.net/api/count"

echo "Using endpoint $ENDPOINT"

curl \
 --header "Content-Type: application/json" \
 --data '{ "words":[ "apple", "bannana", "pears" ], "char":"a" }' \
 $ENDPOINT

echo " <-- expect 5"

curl \
 --header "Content-Type: application/json" \
 --data '{ "words":[ "apple", "bannana", "pears" ], "char":"p" }' \
 $ENDPOINT

echo " <-- expect 3"

 curl \
 --header "Content-Type: application/json" \
 --data '{ "words":[ "apple", "bannana", "pears" ], "char":"x" }' \
 $ENDPOINT

echo " <-- expect 0"

