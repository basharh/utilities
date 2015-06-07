#!/bin/sh

apt-get -y install zsh
apt-get -y install git
apt-get -y install vim
chsh -s /bin/zsh vagrant
sudo -H -u vagrant bash << EOF
git clone https://github.com/basharh/utilities
ln -s utilities/home/.inputrc
ln -s utilities/home/.vimrc
ln -s utilities/home/.vim
ln -s utilities/home/.zshenv
ln -s utilities/home/.zshrc
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/jlanzarotta/bufexplorer
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/wesgibbs/vim-irblack
EOF

