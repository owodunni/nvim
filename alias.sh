#!/bin/bash

alias rc="source ~/.zshrc"

#   Git
# --------------------------------------------------------------

master="master"

# Show git dirty state in bash prompt
GIT_PS1_SHOWDIRTYSTATE=" "

# not to confuse with gs (Ghost Script on some systems)
alias gg="git status"
alias gs="git status"

alias gf="git fetch"
alias gp="git push"
alias gpo="git push origin"
alias gpof="gpo --force-with-lease"
alias gmff="git merge --ff-only"

# git rebase
alias gr="git rebase"
alias gri="git rebase -i"
alias grim="git rebase -i $master"
alias grm="git rebase $master"

# Just rewrite the branch interactively, do not move the branch
alias grib='git rebase -i $(git merge-base $master HEAD)'
alias grc="git rebase --continue"
alias gra="git rebase --abort"
# git log
alias gl="git log --graph --oneline --decorate --branches"

# git log all branches
alias gla="git log --graph --oneline --decorate --all"

# git log limited output
alias gll="git log --graph --oneline --decorate -22 --branches"

# git log limited output all branches
alias glla="git log --graph --oneline --decorate -22 --all"

alias ga="git add"
alias gap="git add -p"

alias gd="git diff"
alias gdc="git diff --cached"
alias gdw="git diff --word-diff=color --patience"
alias gdcw="git diff --cached --word-diff=color --patience"

alias gdel="git push origin --delete"

# git directory diff in e.g. Meld
alias dirdiff="git difftool --dir-diff"

# git whole branch directory diff in e.g. Meld
function branchdiff {
    ancestor="$(git merge-base $master HEAD)"
    echo "Ancestor between HEAD and $master is $ancestor"
    echo "Starting diff tool..."
    git difftool --dir-diff $ancestor..HEAD --
}

alias gb="git branch"
alias gc="git commit"

# git commit with message
alias gcm="git commit -m"
function gom {
    git commit -m "$*"
}
function gam {
    git commit -am "$*"
}
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"

# X (as in eXchange branch) so not to be confused with C (as in commit)
alias gx="git checkout"
alias gxb="git checkout -b"

# scoreboard :)
alias gstat="git shortlog --summary --numbered"

# list ignored files
alias gif="git ls-files . --ignored --exclude-standard --others"

# List untracked files
alias guf="git ls-files . --exclude-standard --others"

# Grep the git log. Example usage:
#  greplog RNX-1234
function greplog {
    git log --all --grep=$1
}

# Update local git branch from origin. If no argument is given, the
# current branch is updated
function gup () {
    if [ $# -eq 1 ]
    then
        git checkout $1 || return 1
    fi
    git pull origin --ff-only
}

alias gupm="gup $master"

alias cop="!git checkout $1 && git pull && git submodule foreach --recursive git pull origin master &&:"

function gsplit () {
    message="$(git log --pretty=format:'%s' -n1)"
    if [ `git status --porcelain --untracked-files=no | wc -l` = 0 ]
    then
       git reset --soft HEAD~
    fi
    git status --porcelain --untracked-files=no | while read stat file;
    do
       echo $stat $file
       shaid="$(git log -n 1 --pretty=format:%H -- $file)"

       if [ "$stat" = "M" ]
       then
          git add $file
          git commit -n $file --fixup $shaid
       elif [ "$stat" = "A" ]
       then
          git add $file
          git commit -n $file -m "added $file: $message"
       elif [ "$stat" = "D" ]
       then
          git rm $file
          git commit -n $file --fixup $shaid
       else
          echo "unknown status $file"
       fi
    done
}

function grev () {
    regex="^(r\/).+"
    name="$(git rev-parse --abbrev-ref HEAD)"
    if ! [[ $name =~ $regex ]]; then
	    name="r/$name"
	    git branch -m "$name"
    fi
    git push --set-upstream critic "$name"
}

function gcopy () {
  if [[ $# -ne 2 ]] ; then
    echo "Usage: gcopy original copy"
    exit 0
  fi

  git mv "$1" "$2"
  git commit -n -m "Split history $1 to $2 - rename file to target-name"
  REV=`git rev-parse HEAD`
  git reset --hard HEAD^
  git mv "$1" temp
  git commit -n -m "Split history $1 to $2 - rename source-file to temp"
  git merge $REV
  git commit -a -n -m "Split history $1 to $2 - resolve conflict and keep both files"
  git mv temp "$1"
  git commit -n -m "Split history $1 to $2 - restore name of source-file"
}

# gradle
alias gw=gradle
alias ll='ls -al'

# Opera
alias browser='cd $HOME/Work/browser'
alias wallet='cd $HOME/Work/browser/android/wallet/webapp/source'
alias ofa='cd $HOME/Work/work/mobile/mobile'
alias LS='cd $HOME/Work/ls'
