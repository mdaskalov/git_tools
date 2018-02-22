#!/bin/sh

if [ $# -lt 3 ]; then
	echo "usage: $0 <email_list> <name> <email>"
	echo "Changing the Git history from <email_list> to new <name> and <email>"
	exit 1;
fi

if [ ! -d ".git" ]; then
  echo "Curent directory is not under version control - .git not found."
  exit 1
fi

EMAIL_LIST="$1"
CORRECT_NAME="$2"
CORRECT_EMAIL="$3"

echo "Changing \"${EMAIL_LIST}\" to ${CORRECT_NAME} <${CORRECT_EMAIL}>"

git filter-branch -f --env-filter '
if [[ "'"${EMAIL_LIST}"'" = *"$GIT_COMMITTER_EMAIL"* ]]; then
  export GIT_COMMITTER_NAME="'"${CORRECT_NAME}"'"
  export GIT_COMMITTER_EMAIL="'"${CORRECT_EMAIL}"'"
fi
if [[ "'"${EMAIL_LIST}"'" = *"$GIT_AUTHOR_EMAIL"* ]]; then
  export GIT_AUTHOR_NAME="'"${CORRECT_NAME}"'"
  export GIT_AUTHOR_EMAIL="'"${CORRECT_EMAIL}"'"
fi
' --tag-name-filter cat -- --branches --tags
