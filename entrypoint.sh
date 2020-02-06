#!/usr/bin/env sh
set -e # Abort script at first error

args="--regex --json --max_depth=50" # Default trufflehog options

if [ -n "${INPUT_SCANARGUMENTS}" ]; then
  args="${INPUT_SCANARGUMENTS}" # Overwrite if new options string is provided
fi

echo "Starting Scan"

mkdir -p $GITHUB_WORKSPACE/reports

echo Command: trufflehog $args $GITHUB_WORKSPACE
trufflehog $args $GITHUB_WORKSPACE > /tmp/output.json
jq . /tmp/output.json > $GITHUB_WORKSPACE/reports/truffleHog.json

echo $(cat $GITHUB_WORKSPACE/reports/truffleHog.json)
