#Set up system (after a fresh install of ubuntu-suerver

echo "System Setup Script"
echo "Version 1.0-ish"
sleep 2
echo "This will attempt to install a large number of (useful) programs."
echo "Any current configuration on this user/machine will likely get clobbered."
sleep 4
echo "You've been warned."
sleep 3


if [[ $(command -v xinit) && $(command -v i3) ]]; then 
	echo "X server and i3 already installed, skipping"
else
	#install x server and repository i3
	sudo apt-get install xinit
	sudo apt-get install i3
fi

#Ubuntu stuff reuqired
sudo apt-get install software-properties-common 

#Install google chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 libconfig9 libpango1.0-0 fonts-liberation
sudo apt-get -f install
if [[ $(command -v google-chrome) ]]; then
  echo "Google chrome already installed, skipping"
else  
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome*.deb
fi

#Install desktop programs
sudo apt-get install pcmanfm feh conky

if [[ $(command -v subl) ]]; then
	echo "Sublime text already installed, skipping"
else
	#Install sublime text
	sudo add-apt-repository ppa:webupd8team/sublime-text-3
	sudo apt-get update
	sudo apt-get install sublime-text-installer
fi

#install development tools
sudo apt-get install terminator vim

#Configure vim and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall



#Install ZSH
if [[ $(command -v zsh) ]]; then
	echo "zsh already installed, skipping"
else 
	sudo apt-get install zsh
	sudo apt-get install git-core
	#Change shell to zsh 
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	chsh -s `which zsh`
	echo "zsh installed, restart required to take effect"
fi
#TODO: Configure zsh?


#Install development programs
if [[ $(command -v php) && $(command -v apache2) ]]; then 
	echo "php and apache2 already installed, skipping"
else
	sudo apt-get install php7.0 apache2
fi

if [[ $(command -v mysql) && $(command -v phpmyadmin) ]]; then 
	echo "mysql-server already installed, skipping"
else
	sudo apt-get install mysql-server
fi

if [[ $(command -v zsh) ]]; then
	echo "redis-server already installed, skipping"
else
	sudo apt-get install redis-server
fi


echo "Installing essential build tools"
sudo apt-get install git make g++ gcc build-essential

#Configure git
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.unstage 'reset HEAD --'
git config --global push.default simple

#NodeJS

if [[ $(node -v) == *7.* ]]; then
  echo "Current version of node installed, skipping"
else
  #Install nodejs tools
  sudo apt-get install npm
  sudo npm install -g n
  sudo n latest
  sudo npm install -g npm #update npm
  sudo npm install -g grunt-cli gulp
fi

#Composer

if [[ $(command -v composer) ]]; then
  echo "Composer already installed, skipping"
else
  echo "Installing Composer";
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"
  mv composer.phar composer
  sudo chmod a+x composer
  sudo mv composer /usr/local/bin/composer
  sudo composer self-update
fi

#Install lx themes (change using lxappearance)
sudo apt-get install human-theme human-icon-theme lxappearance
sudo apt-get install compton
sudo apt-get install pavucontrol

#Export dotfiles configuration
#This expects various config files to exist on the system (though they will be overwritten) so this should be done last
echo "Exporting dotfiles configuration"
cd ~/dotfiles
bash export.sh

if [[ $(/usr/bin/i3 -v) == *4.12* ]]; then
  echo "i3 already using airblader gaps version, skipping"
else
  #Install i3 airblader gaps instead of regular i3
  echo "Installing airblader/i3 i3-gaps version of i3"
  sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf

  git clone https://github.com/Airblader/i3.git i3-gaps
  cd i3-gaps
  git checkout tags/4.12
  make && sudo make install
  sudo rm -r i3-gaps
fi

#Todo: Setup startup bash file

read -p "Some changes may require a restart. Restart this machine now? y/n " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo shutdown -r 0
fi


