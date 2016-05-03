# Autojump {{{
[ -f /usr/local/share/autojump/autojump.fish ];
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

# Aliases {{{
alias .. 'cd ..'
alias ... 'cd ../..'
alias cp 'cp -v'
alias mv 'mv -v'
alias ll 'ls -FGlAhp'
alias tns 'tmux new -s'
alias tas 'tmux attach -t'
alias tls 'tmux list-sessions'
alias vim 'nvim'
alias edit 'nvim'
alias c 'clear'
alias f 'open -a Finder .'
alias gg 'git status'

function cis
  ssh cis120 "cis $argv"
end
# }}}

# Exports {{{
set -gx PATH $HOME/.cabal/bin $PATH
set -gx PATH $HOME/.multirust/toolchains/stable/cargo/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
set -gx PATH $HOME/.rbenv/bin $PATH
rbenv rehash >/dev/null ^&1
set -gx PATH ./bin $PATH
eval (opam config env)
# }}}
