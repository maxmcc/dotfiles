# Defined in /var/folders/fl/jnfk9c_16231nqf396jgs2gm0000gn/T//fish.wFSsIX/bu.fish @ line 2
function bu
  brew update
  and brew upgrade
  and brew upgrade --cask
  and brew cleanup
end
