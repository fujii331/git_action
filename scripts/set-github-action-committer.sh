echo "[remote \"origin\"]" >| .git/config
echo "url = https://github-actions[bot]:$GITHUB_TOKEN@github.com/$OWNER/$REPO.git" >> .git/config
git config --global user.email "test@test.com"
git config --global user.name "github-actions"