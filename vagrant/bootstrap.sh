#!/bin/sh

apt-get -y install zsh
apt-get -y install git
apt-get -y install vim
chsh -s /bin/zsh vagrant
sudo -H -u vagrant bash << EOF
git clone https://github.com/basharh/utilities
ln -s utilities/home/.inputrc
ln -s utilities/home/.vimrc
ln -s utilities/home/.zshenv
ln -s utilities/home/.zshrc
EOF

