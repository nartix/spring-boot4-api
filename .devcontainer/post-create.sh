#!/usr/bin/env bash

set -e

chmod +x ./uniapi/gradlew
./uniapi/gradlew --no-daemon -p uniapi build -x test

npm install -g gitnexus
git config --global --add safe.directory "${containerWorkspaceFolder}" || true
gitnexus analyze || true
