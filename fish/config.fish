# Autojump {{{
[ -f /usr/local/share/autojump/autojump.fish ];
  and . /usr/local/share/autojump/autojump.fish
# }}}

# Fish plugins {{{
fundle plugin 'tuvistavie/oh-my-fish-core'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'oh-my-fish/plugin-osx'
fundle plugin 'tuvistavie/fish-fastdir'

fundle init
# }}}

# Exports {{{
status --is-interactive; and . (rbenv init -|psub)

set -gx MYVIMRC $HOME/.dotfiles/nvim/init.vim
set -gx FISHCONF $HOME/.dotfiles/fish/config.fish
# }}}
