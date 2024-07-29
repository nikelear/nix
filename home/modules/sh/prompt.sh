function __prompt_git {
  local gst="$(git status --porcelain --branch 2> /dev/null)"
  [[ -z $gst ]] && return 0

  local branch=""
  while IFS= read -r line;do
    if [[ "$line" =~ "## " ]]; then
      branch="${line%%...*}"
      branch="${branch##"## "}"
      break
    fi
  done <<< "$gst"

  local marks=""
  [[ $gst =~ "behind" ]] && marks+="<"
  [[ $gst =~ "ahead" ]] && marks+=">"
  [[ $gst =~ "\?\?" ]] && marks+="?"
  [[ $gst =~ "[MA][ MTD] " ]] && marks+="+"
  [[ $gst =~ "R[ MTD] " ]] && marks+="»"
  [[ $gst =~ "[ MTARC]M " ]] && marks+="!"
  [[ $gst =~ "[ MTARC]D " ]] && marks+="x"
  [[ $gst =~ "D  " ]] && marks+="X"
  [[ $gst =~ "UU " ]] && marks+="="
  
  [[ $(git stash list) ]] && marks+="$"

  [[ -z $marks ]] || marks="[$marks]"
  
  echo " %F{magenta}($branch)%f $marks "
}

function async_prompt_update() {
    (echo $(__prompt_git) > /tmp/prompt_result &)
}

function apply_prompt_result() {
    if [[ -f /tmp/prompt_result ]]; then
        local result=$(< /tmp/prompt_result)
        local p_pwd=$'%F{cyan}%D %T%f [%~] '
        local p_name=$'\n%n%F{yellow}@%m%f '
        local p_icon="%(?,%F{green},%F{red})%(!,#,{%L})%f "
        PROMPT=$p_pwd$result$p_name$p_icon
    fi
}

precmd_functions+=(apply_prompt_result async_prompt_update)

