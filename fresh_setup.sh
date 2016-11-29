#Set up system (after a fresh install of ubuntu-suerver

#first, install x server
sudo apt-get install xinit
sudo apt-get install i3
sudo apt-get install conky

#Ubuntu stuff reuqired
sudo apt-get install software-properties-common 

#Install google chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 libconfig9 libpango1.0-0 fonts-liberation
sudo apt-get -f install
if command -v google-chrome ; then
  echo "Google chrome already installed, skipping"
else  
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome*.deb
fi

#Install desktop programs
sudo apt-get install pcmanfm

#Install sublime text
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

#Install development tools
sudo apt-get install vim php7.0 apache2 git make g++ gcc build-essential mysql-server phpmyadmin redis-server

#Install nodejs tools
sudo apt-get install npm
sudo npm install -g n
sudo n latest
sudo npm install -g grunt-cli gulp

echo "Installing Composer";
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo apt-get install human-theme human-icon-theme lxappearance
sudo apt-get install compton
#Set appearance in lxappearance to theme (dark theme)

#Install i3 airblader gaps instead of regular i3
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf

git clone https://github.com/Airblader/i3.git i3-gaps
cd i3-gaps
git checkout tags/4.12
make && sudo make install

#Todo: Restart machine after everything is done, and setup startup bash file

