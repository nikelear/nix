PROMPT=$'%F{green}%n%f%F{red}@%m%f % %F{yellow}Loading... %f\n$ '
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
  [[ $gst =~ "[MA][ T] " ]] && marks+="+"
  [[ $gst =~ "R[ MTD] " ]] && marks+="»"
  [[ $gst =~ "[ MTARC]M " ]] && marks+="!"
  [[ $gst =~ "[ MTARC]D " ]] && marks+="x"
  [[ $gst =~ "UU " ]] && marks+="="
  
  [[ $(git stash list) ]] && marks+="$"

  [[ -z $marks ]] || marks="[$marks]"
  
  echo " ($branch) $marks "
}

function async_prompt_update() {
    (echo $(__prompt_git) > /tmp/prompt_result &)
}

function apply_prompt_result() {
    if [[ -f /tmp/prompt_result ]]; then
        local result=$(< /tmp/prompt_result)
        PROMPT="%F{green}%n%f%F{red}@%m%f % ${result}%f"$'\n$ '
    fi
}

precmd_functions+=(apply_prompt_result async_prompt_update)

