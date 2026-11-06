#!/usr/bin/bash

set -euo pipefail

if [[ $# != 2 ]]; then
  echo "==> ERROR: Expected 2 arguments. Received $#"
  exit 2
fi

OUT_FILE="$1"
URL="$2"

ARIA2_OPTS="-x8 -s8 -k1M --continue=true --allow-overwrite=true --auto-file-renaming=false --file-allocation=none"

GH_PROXY='https://gh-proxy.org/'
if [[ "$URL" == *"//raw.githubusercontent.com/"* || "$URL" == *"//github.com/"*"/releases/download/"* ]]; then
  echo "==> INFO: GitHub URL detected: $URL"
  if ! curl -sfI -m 4 -o /dev/null "$URL"; then
    URL="${GH_PROXY}${URL}"
    echo "==> INFO: Could not connect to source URL, using a download proxy: $URL"
  fi
fi

# shellcheck disable=SC2086
aria2c -o "$OUT_FILE" $ARIA2_OPTS "$URL"
