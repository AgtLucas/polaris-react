#!/usr/bin/env bash
shopt -s extglob
set -e

yarn run build
yarn pack
echo $GOOGLE_CLOUD_SERVICE_ACCOUNT
echo $GOOGLE_CLOUD_SERVICE_ACCOUNT > './gcpKey.json'
cat ./gcpKey.json
export GOOGLE_APPLICATION_CREDENTIALS="$(pwd)/gcpKey.json"
mv shopify-polaris-*.tgz "shopify-polaris-${BUILDKITE_COMMIT}.tgz"
pwd
node ./scripts/upload-artifact.js "./shopify-polaris-${BUILDKITE_COMMIT}.tgz"
