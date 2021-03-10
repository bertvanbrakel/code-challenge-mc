# TL;DR;

To build and run locally

```
npm install
npm run serve
```

Thee is a 'tests.sh' file to quickly run the curl commands

# Running inside a container (using vs-code)

Open the

```
moneycatcha.code-workspace
```

file from vs-code (with the dev containers plugin installed).

This will prompt to open the whole lot in a container (after an automatic container build). Then change into the workspace folder and run the npm commands above

```
cd /workspace/
```

# Deploying to firebase functions

Run

```
npm install
npm run firebase:login
npm run deploy

```

# Invoking via curl

## Locally

curl \
 --header "Content-Type: application/json" \
 --data '{ "words":[ "apple", "bannana", "pears" ], "char":"a" }' \
 http://localhost:8080/moneycatcha-dev/us-central1/api/count

## Publicly

curl \
 --header "Content-Type: application/json" \
 --data '{ "words":[ "apple", "bannana", "pears" ], "char":"a" }' \
 https://us-central1-moneycatcha-dev.cloudfunctions.net/api/count
