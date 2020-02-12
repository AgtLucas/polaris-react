#!/usr/bin/env bash
shopt -s extglob
set -e

yarn run build
yarn pack
echo $GOOGLE_CLOUD_SERVICE_ACCOUNT > './gcpKey.json'
export GOOGLE_APPLICATION_CREDENTIALS="$(pwd)gcpKey.json"
pwd
node ../scripts/upload-artifact.js
