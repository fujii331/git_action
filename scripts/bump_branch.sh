#!/bin/bash

set -ex

git switch -c "$DEPLOY_BRANCH" "$BASE_BRANCH"
git push origin "$DEPLOY_BRANCH" -f

COMMIT_MESSAGE="stagingにデプロイ"
URL="https://api.github.com/repos/$OWNER/$REPO/pulls"
DATA="{\"title\": \"$COMMIT_MESSAGE\", \"head\": \"$BRANCH_NAME\", \"draft\": false, \"base\": \"$DEPLOY_BRANCH\"}"
curl -d "$DATA" -X POST -s -H "Authorization: token $GITHUB_TOKEN" "$URL"
