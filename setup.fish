set DOTS ~/.dotfiles
set CONFIG ~/.config

mkdir -p $CONFIG/fish
function fishlink
    ln -Fs $DOTS/fish/$argv $CONFIG/fish/$argv
end

fishlink config.fish
fishlink functions

mkdir -p $CONFIG/nvim
function vimlink
    ln -Fs $DOTS/nvim/$argv $CONFIG/nvim/$argv
end

vimlink init.vim
vimlink ftplugin
vimlink plugin

curl -fLo $CONFIG/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -Fs $DOTS/tmux/tmux.conf ~/.tmux.conf
ln -Fs $DOTS/git/config ~/.gitconfig
mkdir -p ~/.ssh; and ln -Fs $DOTS/ssh/config ~/.ssh/config; and ln -Fs $DOTS/ssh/configs/ ~/.ssh/configs/
