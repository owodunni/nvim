#!/bin/bash

alias rc="source ~/.zshrc"

#   Git
# --------------------------------------------------------------

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
alias grim="git rebase -i master"
alias grm="git rebase master"
# Just rewrite the branch interactively, do not move the branch
alias grib='git rebase -i $(git merge-base master HEAD)'
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
    ancestor=$(git merge-base master HEAD)
    echo "Ancestor between HEAD and master is $ancestor"
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

alias gupm="gup master"

