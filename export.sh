#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;


function doExport() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "export.sh" \
          --exclude "iREADME.md" -avh --no-perms . ~;

}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$i ]]; then
  doExport;
fi;

unset doExport;
