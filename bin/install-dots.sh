#!/usr/bin/env zsh

repo=NickCrew/dot.git
git_dir=$HOME/.dots.git

alias cfg="git --work-tree=$HOME --git-dir=${git_dir}"

git clone --bare https://github.com/${repo} $git_dir

cfg config --local status.showUntrackedFiles no
cfg checkout
cfg remote set-url origin ssh://git@github.com:${repo}

if [[ $? != "0" ]]; then
  echo "Failed to checkout files."
fi
