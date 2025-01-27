#!/bin/bash

PUB_KEY="./calvyn.pub"
USERNAME="root"
IP_TARGET="x.x.x.x"

ssh-copy-id -i ~"$PUB_KEY" "$USERNAME"@"$IP_TARGET"