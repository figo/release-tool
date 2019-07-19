#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

REPO_PATH="$1"
REPO_NAME="$2"
DOWNSTREAM_URL="${3}"
UPSTREAM_URL="$4"

cd "$REPO_PATH"
git clone "$DOWNSTREAM_URL"
cd "$REPO_NAME"
git remote add upstream "$UPSTREAM_URL"

