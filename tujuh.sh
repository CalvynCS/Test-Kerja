#!/bin/bash

FILE_PUBKEY="./calvyn.pub"
USERNAME="root"
IP_TARGET="x.x.x.x"


ssh-copy-id -i "$FILE_PUBKEY" "$USERNAME"@"$IP_TARGET"