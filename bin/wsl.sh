# for wsl
if [ -d /mnt/c/windows ]; then

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
    ln -s "$code" $tgt/code
  fi
  
fi
