#!/bin/bash

set -ex

git checkout "$BASE_BRANCH"
git branch -D "$DEPLOY_BRANCH" && git checkout -b "$DEPLOY_BRANCH"
git push origin "$DEPLOY_BRANCH" -f

COMMIT_MESSAGE="stagingにデプロイ"
URL="https://api.github.com/repos/$OWNER/$REPO/pulls"
DATA="{\"title\": \"$COMMIT_MESSAGE\", \"head\": \"$BRANCH_NAME\", \"draft\": false, \"base\": \"$DEPLOY_BRANCH\"}"
curl -d "$DATA" -X POST -s -H "Authorization: token $GITHUB_TOKEN" "$URL"
