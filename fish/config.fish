# Autojump {{{
[ -f /usr/local/share/autojump/autojump.fish ];
  and . /usr/local/share/autojump/autojump.fish
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
status --is-interactive; and . (rbenv init - | psub)
if test -d ~/.cargo
  set -gx PATH $PATH ~/.cargo/bin
end
if test -d ~/.opam
  source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

set -gx EDITOR nvim
# }}}
