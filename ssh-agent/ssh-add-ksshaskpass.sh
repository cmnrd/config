#!/bin/sh

sleep 10

# Wait for kwallet
kwallet-query -l kdewallet > /dev/null

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export SSH_ASKPASS="/usr/bin/ksshaskpass"
ssh-add
