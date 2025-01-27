#!/bin/bash

PUB_KEY_FILE="./calvyn.pub"
AUTHORIZE_LOC="root/.ssh/authorized_keys"
PUB_KEY=$(cat "$PUBLIC_KEY_FILE")

grep -vF "$PUB_KEY" "$AUTHORIZE_LOC" > "${AUTHORIZE_LOC}.tmp"
mv "${AUTHORIZE_LOC}.tmp" "$AUTHORIZE_LOC"

echo "PUB_KEY form '$PUBLIC_KEY_FILE' has been removed from '$AUTHORIZE_FILE'."