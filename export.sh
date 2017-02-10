#!/usr/bin/env bash

git pull origin master
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$i ]]; then

  cd "$(dirname "${BASH_SOURCE}")";

  directories=( .config .irssi .i3 .oh-my-zsh )
  for i in "${directories[@]}"
  do
    files=(`cd ~/dotfiles/$i && find . -printf '/%P\n'`)
    for k in "${files[@]}"
    do
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

fi;
