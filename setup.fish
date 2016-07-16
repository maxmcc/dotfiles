set DOTS ~/.dotfiles
set CONFIG ~/.config

mkdir -p $CONFIG/fish
function fishlink
    ln -s $DOTS/fish/$argv $CONFIG/fish/$argv
end

fishlink config.fish
fishlink functions

mkdir -p $CONFIG/nvim
function vimlink
    ln -s $DOTS/nvim/$argv $CONFIG/nvim/$argv
end

vimlink init.vim
vimlink autoload
vimlink ftplugin
vimlink plugin

ln -s $DOTS/tmux/tmux.conf ~/.tmux.conf
ln -s $DOTS/git/config ~/.gitconfig
mkdir -p ~/.ssh/config; and ln -s $DOTS/ssh/config ~/.ssh/config
