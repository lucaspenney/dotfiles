#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;


function doImport() {
    find . -maxdepth 4 -type f -not -path "*git*" -not -name "import.sh" -not -name "README.md" -not -name "export.sh" | while read -r i
    do
        cp ~/$i ./$i
    done
}

read -p "This will import the current computer's home directory files into the dotfiles repo.  Are you sure? (y/n) " -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$i ]]; then
  doImport
fi;

unset doImport;
