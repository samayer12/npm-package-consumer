#!/usr/bin/env bash

# Run with default version
npm install
npm run build # Build with updated dependency version
printf "Using dependency version: %s" "$(npm list @samayer12/npm-package-demo)"
npm run dev > /dev/null 2>&1 & # Start server

sleep 5 # Wait for server to start

SERVER_PID=$(lsof -i :5173 | grep LISTEN | awk '{print $2}') # Get PID of process we just started

curl localhost:5173 # Get webpage contents

kill "$SERVER_PID" # Stop server

# Change dependency version
printf "Changing dependency version to 0.0.9"
rm package-lock.json # Bad practice IRL, doing this just to toggle between versions easily
cp package.json package.json.bak
jq '.dependencies["@samayer12/npm-package-demo"]="0.0.9"' package.json.bak > package.json
diff package.json package.json.bak

# Run with new version
npm install
npm run build # Build with updated dependency version
printf "Using dependency version: %s" "$(npm list @samayer12/npm-package-demo)"
npm run dev > /dev/null 2>&1 & # Start server

sleep 5 # Wait for server to start

SERVER_PID=$(lsof -i :5173 | grep LISTEN | awk '{print $2}') # Get PID of process we just started

curl localhost:5173 # Get webpage contents

kill "$SERVER_PID" # Stop server

mv package.json.bak package.json # Reset version
git reset --hard origin/main # Reset to server's version of main, just to be sure
