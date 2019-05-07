function bu
	sudo chown -R (whoami) /usr/local/bin /usr/local/etc /usr/local/lib /usr/local/sbin \
    /usr/local/share /usr/local/Frameworks /usr/local/share/locale /usr/local/share/man
  and brew update
  and brew upgrade
  and brew cask upgrade
  and brew cleanup
end
