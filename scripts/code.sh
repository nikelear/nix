#!/usr/bin/env sh

userprofile=$(cd /mnt/c && cmd /C echo %USERPROFILE% | tr -d '\r')
fd=$(echo "$userprofile" | awk -F'\\' '{print $NF}')
"/mnt/c/Users/$fd/AppData/Local/Programs/Microsoft VS Code/bin/code" "$@"
