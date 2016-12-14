#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

directories=( .config .irssi .i3 .oh-my-zsh )
for i in "${directories[@]}"
do
  files=(`cd ~/dotfiles/$i && find . -printf '/%P\n'`)
  for k in "${files[@]}"
  do
    echo $i$k;
    if [[ -d $i$k ]]; then
      echo "Directory, skipping symlink"
    else
      echo "Symlinking $i$k"
      ln -fs ~/dotfiles/$i$k ~/$i$k
    fi
  done
done

files=(.vimrc .xModmap .zshrc .bashrc)
for f in "${files[@]}"
do
  echo $f
  ln -fs ~/dotfiles/$f ~/$f
done

exit;
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
