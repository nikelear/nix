
function zle-keymap-select {
  case $KEYMAP in
    vicmd)  RPROMPT="%F{green}[NORMAL]%f" ;;
    viins)  RPROMPT="%F{blue}[INSERT]%f" ;;
    isearch) RPROMPT="%F{yellow}[SEARCH]%f" ;;
    vreplace) RPROMPT="%F{red}[REPLACE]%f" ;;
    visual) RPROMPT="%F{purple}[VISUAL]%f" ;;
    *) RPROMPT='' ;;
  esac
  zle reset-prompt
}

# bind zle
zle -N zle-keymap-select
