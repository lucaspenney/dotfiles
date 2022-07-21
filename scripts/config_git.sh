#Configure git
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.unstage 'reset HEAD --'
git config --global push.default simple
git config --global credential.helper 'cache --timeout 60000'

echo "If you aren't Lucas Penney, this script just messed up your git config name and email.";
git config --global user.email "lucaspenney@gmail.com"
git config --global user.name "Lucas Penney"