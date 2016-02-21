# Autojump {{{
[ -f /usr/local/share/autojump/autojump.fish ];
  and . /usr/local/share/autojump/autojump.fish
# }}}

# Fish plugins {{{
fundle plugin 'tuvistavie/oh-my-fish-core'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'oh-my-fish/theme-default'
fundle plugin 'oh-my-fish/plugin-osx'

fundle init
# }}}
