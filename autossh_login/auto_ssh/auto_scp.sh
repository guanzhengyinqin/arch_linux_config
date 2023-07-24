#!/bin/bash
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
JS_FILE=$SHELL_FOLDER/../auto_scp/parse_parameters.js
# shellcheck disable=SC2068
#$SHELL_FOLDER/../auto_scp/download.ex $(node $JS_FILE $@ $SHELL_FOLDER/../config/auto_ssh.json)
PARS=($(node $JS_FILE $@ $SHELL_FOLDER/../config/auto_ssh.json))

# echo $SHELL_FOLDER/../auto_scp/download.ex
# shellcheck disable=SC1073
if [ "download" == "${PARS[0]}" ]; then
  $SHELL_FOLDER/../auto_scp/download.ex ${PARS[1]} ${PARS[2]} ${PARS[3]} ${PARS[4]} ${PARS[5]} ${PARS[6]} ${PARS[7]}
elif [ "upload" == "${PARS[0]}" ]; then
  $SHELL_FOLDER/../auto_scp/upload.ex ${PARS[1]} ${PARS[2]} ${PARS[3]} ${PARS[4]} ${PARS[5]} ${PARS[6]} ${PARS[7]}
elif [ "remote" == "${PARS[0]}" ]; then
  $SHELL_FOLDER/../auto_scp/remote.ex ${PARS[1]} ${PARS[2]} ${PARS[3]} ${PARS[4]} ${PARS[5]} ${PARS[6]} ${PARS[7]} ${PARS[8]} ${PARS[9]} ${PARS[10]} ${PARS[11]}
fi
