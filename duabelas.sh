#!/bin/bash

SOURCE_DIR="."
USERNAME="root"
IP_TARGET="x.x.x.x"

#==SCP==
scp "$SOURCE_DIR" "$USERNAME"@"$IP_TARGET":/root/test/a/

#==RSYNC==
rsync "$SOURCE_DIR" "$USERNAME"@"IP_TARGET":/root/test/b/