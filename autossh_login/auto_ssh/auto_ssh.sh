#!/bin/bash
# shellcheck disable=SC2046
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
$SHELL_FOLDER/login.ex $(node $SHELL_FOLDER/../index.js -f $SHELL_FOLDER/../config/auto_ssh.json -c $1)