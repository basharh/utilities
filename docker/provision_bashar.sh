cd ~
git clone https://github.com/basharh/utilities
ln -s utilities/home/.inputrc
ln -s utilities/home/.vimrc
ln -s utilities/home/.vim
ln -s utilities/home/.zshenv
ln -s utilities/home/.zshrc
ln -s utilities/home/.screenrc
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/jlanzarotta/bufexplorer
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/wesgibbs/vim-irblack
