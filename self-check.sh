#!/usr/bin/env bash

# Run with default version
npm install

printf "Using dependency version: %s" "$(npm list @samayer12/npm-package-demo)"
npm run dev > /dev/null 2>&1 & # Start server

SERVER_PID=$(lsof -i :5173 | grep LISTEN | awk '{print $2}') # Get PID of process we just started

sleep 5 # Wait for server to start

curl localhost:5173 # Get webpage contents

kill "$SERVER_PID" # Stop server

# Change dependency version
printf "Changing dependency version to 0.0.9"
cp package.json package.json.bak
jq '.dependencies["@samayer12/npm-package-demo"]="0.0.9"' package.json.bak > package.json
diff package.json package.json.bak

# Run with new version
npm install

printf "Using dependency version: %s" "$(npm list @samayer12/npm-package-demo)"
npm run dev > /dev/null 2>&1 & # Start server

SERVER_PID=$(lsof -i :5173 | grep LISTEN | awk '{print $2}') # Get PID of process we just started

sleep 5 # Wait for server to start

curl localhost:5173 # Get webpage contents

kill "$SERVER_PID" # Stop server

mv package.json.bak package.json # Reset version
git reset --hard HEAD # Reset to defaults, just to be sure
