 #/usr/bin/env bash

_gscp(){
  local cur SHELL_FOLDER
#  SHELL_FOLDER=$(dirname $(readlink -f "$0"))
  SHELL_FOLDER="/home/guanzheng/document/script/autossh_login"
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ $cur == @* ]]; then
    COMPREPLY=(`node $SHELL_FOLDER/bash_completion/read_config.js $SHELL_FOLDER/config/auto_ssh.json|tr ',' ' '`)
    return 0
  else
    COMPREPLY=( $(compgen  -f -- $cur))
    return 0
  fi
}
complete -F _gscp gscp
