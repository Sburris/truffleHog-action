#!/bin/sh
set -e # Abort script at first error

args="--regex --json --max_depth=500" # Default trufflehog options

if [ -n "${INPUT_SCANARGUMENTS}" ]; then
  args="${INPUT_SCANARGUMENTS}" # Overwrite if new options string is provided
fi

echo "Making reports directory"
mkdir -p $GITHUB_WORKSPACE/reports

echo "List workspace"
echo $(ls -l $GITHUB_WORKSPACE)

echo "Starting Scan"
trufflehog $args $GITHUB_WORKSPACE | jq . > $GITHUB_WORKSPACE/reports/truffleHog.json