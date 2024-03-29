curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

set DOTS ~/.dotfiles
set CONFIG ~/.config

mkdir -p $CONFIG/fish
function fishlink
    ln -Fs $DOTS/fish/$argv $CONFIG/fish/$argv
end
fishlink config.fish
fishlink functions
fishlink completions

set -U EDITOR nvim
set -U fish_user_paths (brew --prefix)/bin (brew --prefix)/opt/ruby/bin ~/.cargo/bin

mkdir -p $CONFIG/nvim
function vimlink
    ln -Fs $DOTS/nvim/$argv $CONFIG/nvim/$argv
end
vimlink init.vim
vimlink ftplugin
vimlink plugin
vimlink coc-settings.json
curl -fLo $CONFIG/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -Fs $DOTS/tmux/tmux.conf ~/.tmux.conf

ln -Fs $DOTS/git/config ~/.gitconfig

ln -Fs $DOTS/ssh/config ~/.ssh/config

