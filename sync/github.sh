#!/bin/bash

echo ""
echo "$0: Start on $(date)..."

if [ -z "$BACKUP_DIR" ]
then
  echo "Need environment var: \$BACKUP_DIR"
  exit 1
fi

if [ -z "$BACKUP_GH_USER" ]
then
  echo "Need environment var: \$BACKUP_GH_USER"
  exit 1
fi

GITHUB_URL="https://api.github.com/users/${BACKUP_GH_USER}/repos?type=owner&per_page=100"
DIR_PREFIX="${BACKUP_DIR}/cloud/github"

# Loop through each repo
# TODO: Limited to 100 repos, paging?
repo_count=0
for repo_url in $(curl -s "$GITHUB_URL" | grep -Po '(?<="git_url": ")[^"]+(?=")')
do

  # Some variables
  repo_filename=$(basename $repo_url)
  repo_name=${repo_filename::-4}
  repo_target="${DIR_PREFIX}/${repo_name}"

  echo "Pulling ${repo_name}..."

  # Delete targets that exist
  if [ -d $repo_target ]
  then
    cd $repo_target
    git pull -f > /dev/null
  else
    git clone $repo_url $repo_target > /dev/null
  fi

  repo_count=$((repo_count+1))
done

echo "$0: Finished ${repo_count} repo(s) on $(date)."

