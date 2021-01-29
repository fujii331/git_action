#!/bin/bash

set -ex

BRANCH_NAME = "bump_$DEPLOY_BRANCH"
git switch -c "$BRANCH_NAME" "$BASE_BRANCH"
git push origin "$BRANCH_NAME"
COMMIT_MESSAGE="patch-chore: Reflect $BASE_BRANCH branch change to $DEPLOY_BRANCH branch"
URL="https://api.github.com/repos/$OWNER/$REPO/pulls"
DATA="{\"title\": \"$COMMIT_MESSAGE\", \"head\": \"$BRANCH_NAME\", \"draft\": false, \"base\": \"$DEPLOY_BRANCH\"}"
curl -d "$DATA" -X POST -s -H "Authorization: token $GITHUB_TOKEN" "$URL"
