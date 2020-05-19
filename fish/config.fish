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

fundle plugin 'tuvistavie/oh-my-fish-core'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'oh-my-fish/plugin-osx'
fundle plugin 'tuvistavie/fish-fastdir'

fundle init
# }}}

# Exports {{{
if test -d ~/.rbenv
  source (rbenv init - | psub)
end

if test -d ~/.cargo
  set -gx PATH $PATH ~/.cargo/bin
end

if test -d ~/.opam
  source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

set -gx EDITOR nvim
# }}}
