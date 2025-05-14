#!/usr/bin/env bash

# Add all repositories cloned in sub directory plugins as submodules

for repo in plugins/*; do
  url=$(git -C $repo config --get remote.origin.url)
  git submodule add $url $repo
done
git submodule init
git submodule update
