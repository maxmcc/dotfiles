# Defined in /var/folders/55/dtywpm7135s362j7140_vz140000gn/T//fish.7oKfNK/bu.fish @ line 2
function bu
	sudo chown -R (whoami) /usr/local/bin /usr/local/etc /usr/local/lib /usr/local/sbin \
    /usr/local/share /usr/local/Frameworks /usr/local/share/locale /usr/local/share/man \
    /usr/local/include
  and brew update
  and brew upgrade
  and brew cask upgrade
  and brew cleanup
end
