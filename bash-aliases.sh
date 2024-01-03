#!/bin/bash

### Aliases

alias chk="git checkout"

# stash with a message
alias stash="git stash save"
alias pop="git stash pop"

# add all files and commit with a message
alias acmt="git add -A && git commit -m"

# create a command for amending without needing to open an editor
alias amend="git commit --amend --no-edit"
alias cmt="git commit -m"

alias pushy="git push --no-verify"
alias pushr="git push --no-verify --force"

alias pullr="git pull --rebase"

# commit and push no verify
function cmtp() {
  cmt $1 && pushy
}
function acmtp() {
  acmt $1 && pushy
}

### Commands

# kill processes on a given port
function killp() {
  echo "Killing process at Port:$1"
  kill -15 $(lsof -ti:${1})
}

# push new branch to remote
function pushb() {
  # the interpolated command gets the current branch name
  git push -u origin $(git rev-parse --abbrev-ref HEAD) --no-verify
}

# Outputs a list of commands to install all currently installed VSCode Extensions
function vscode-extensions() {
  code --list-extensions | xargs -L 1 echo code --install-extension
}
