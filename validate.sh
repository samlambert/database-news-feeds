#!/bin/bash

echo "Validating feeds.json..."

# Directly check JSON validity and exit if invalid
if ! jq . feeds.json > /dev/null 2>&1; then
  echo "ERROR: feeds.json contains invalid JSON!"
  exit 1
fi

echo "feeds.json is valid JSON!"
exit 0