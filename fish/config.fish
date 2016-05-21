# Autojump {{{
test -f /usr/local/share/autojump/autojump.fish;
  and . /usr/local/share/autojump/autojump.fish
# }}}

# Fish plugins {{{
fundle plugin 'tuvistavie/oh-my-fish-core'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'oh-my-fish/theme-default'
fundle plugin 'oh-my-fish/plugin-osx'
fundle plugin 'tuvistavie/fish-fastdir'

fundle init
# }}}

# Exports {{{
set -gx PATH $HOME/.cabal/bin $PATH
set -gx PATH $HOME/.multirust/toolchains/stable/cargo/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
rbenv rehash > /dev/null ^&1
set -gx PATH ./bin $PATH
eval (opam config env)
# }}}
