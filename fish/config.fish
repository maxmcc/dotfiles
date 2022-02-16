# Autojump {{{
if test -f (brew --prefix)/share/autojump/autojump.fish
  source (brew --prefix)/share/autojump/autojump.fish
end
# }}}

# Fish plugins {{{
if not functions -q fundle
  mkdir -p ~/.config/fish/functions/
  curl -fLo ~/.config/fish/functions/fundle.fish https://git.io/fundle
end

fundle plugin 'danhper/oh-my-fish-core'
fundle plugin 'danhper/fish-completion-helpers'
fundle plugin 'oh-my-fish/plugin-osx'
fundle plugin 'danhper/fish-fastdir'

fundle init
# }}}

