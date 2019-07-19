#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

REPO_PATH="$1"
UPSTREAM_TAG="$2"
BRANCH_NAME_PRERFIX="${3:-vmware}"
DOWNSTREAM_VERSION="${4:-1}"

cd "$REPO_PATH"
git fetch upstream --tags
git push origin v"$UPSTREAM_TAG"

NEW_BRANCH="$BRANCH_NAME_PRERFIX-$UPSTREAM_TAG"
NEW_TAG="v$UPSTREAM_TAG+$BRANCH_NAME_PRERFIX.$DOWNSTREAM_VERSION"

git checkout -b "$NEW_BRANCH" "v$UPSTREAM_TAG"
git push origin "$NEW_BRANCH"
git tag -a -m "$NEW_TAG" "$NEW_TAG"
git push origin "$NEW_TAG"

