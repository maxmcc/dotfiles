# Defined in /var/folders/pm/bwknx3zx5mvf_nvjz1lhl9lc0000gn/T//fish.nTFhrA/kickmounts.fish @ line 1
function kickmounts
  appleconnect signOut
  appleconnect authenticate -a max_mccarthy --show-signIn-dialog
  kinit
  echo Prompting for sudo:
  sudo odutil reset cache
  sudo killall -9 autofsd automount automountd opendirectoryd
  sudo automount -vc
end
