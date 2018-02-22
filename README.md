# GIT Tools

Some useful scripts to work with git

## git_author_rewrite.sh

Changes author and commiter info as described [here](https://help.github.com/articles/changing-author-info).
You can rewrite a list of wrong emails in a single operation.

Usage:
```
./git_author_rewrite.sh <email_list> <name> <email>
```

Example:
```
./git_author_rewrite.sh "john@example.com anonymous@example.com" "John Doe" johndoe@example.com
```

## git_download.sh

Clone git repository including all branches and tags

Usage:
```
./git_download.sh <repo> <dir>
```

Example:
```
./git_download.sh https://github.com/mdaskalov/git_tools.git git_tools
```

## git_move.sh

Move all files in a branch to a subdirectory and rewrite the history. If no branch is specified the HEAD is used. Useful if you want to join two repositories together and preserve the history.

Usage:
```
./git_move.sh <directory> [<branch>]
```

Example:
```
./git_move.sh new_dir
```

To move existing branches:
```
git branch | grep -v 'master' | xargs -n 1 ./git_move.sh new_dir
```
