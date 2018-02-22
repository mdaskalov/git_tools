#!/bin/bash

if [ $# -lt 2 ]; then
	echo "usage: $0 <repo> <dir>"
	echo "Download local copy of <repo> into <dir> including all branches and tags."
	exit 1;
fi

REPO=$1
DIR="$(echo "$2" | sed 's/\/$//')"

echo "Download local copy of $REPO into $DIR."

git clone --mirror $REPO $DIR/.git
cd $DIR
git config --unset core.bare
git reset --hard
git fetch --tags --all
