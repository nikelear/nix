# for wsl
tgt=$HOME/.local/bin
mkdir -p tgt

# link cmd
if [ ! -L $tgt/cmd ]; then
  ln -s "/mnt/c/windows/system32/cmd.exe" $tgt/cmd
fi

# link firefox
ffx="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
if [ ! -L $tgt/firefox ]; then
  if [ -f "$ffx" ]; then
    ln -s "$ffx" $tgt/firefox
  fi
fi

# link vscode
if [ ! -L $tgt/code ]; then
  userprofile=$(cd /mnt/c && cmd /C echo %USERPROFILE% | tr -d '\r')
  fd=$(echo "$userprofile" | awk -F'\\' '{print $NF}')
  code="/mnt/c/Users/$fd/AppData/Local/Programs/Microsoft VS Code/bin/code"
  if [ -f "$code" ]; then
    ln -s "$code" $tgt/code
  fi
fi

# add git credential manager for windows
if [ ! -z $(which git)]; then
  sudo git config --system credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
fi
