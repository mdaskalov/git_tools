#!/bin/bash

if [ $# -lt 1 ]; then
	echo "usage: $0 <dir> [<branch>]"
	echo "Move all files to <dir> subdirectory."
	exit 1;
fi

if [ ! -d ".git" ]; then
  echo "Curent directory is not under version control - .git not found."
  exit 1
fi

DIR="$(echo "$1" | sed 's/\/$//')"
BRANCH=${2:-HEAD}

echo "Move all files to $DIR subdirectory in branch $BRANCH."

git filter-branch -f --index-filter '
    git ls-files -s |
    sed "s,\t,&'"$DIR"'/," |
    GIT_INDEX_FILE="$GIT_INDEX_FILE.new" git update-index --index-info &&
    mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"
' $BRANCH
