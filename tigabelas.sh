#!/bin/bash

# Validasi parameter
if [ $# -ne 3 ]; then
    echo "Usage: $0 <service_name> <exec_start_command> <description>"
    exit 1
fi

# Parameter input
SERVICE_NAME=$1
EXEC_START=$2
DESCRIPTION=$3

# Path file systemd
SYSTEMD_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

# Membuat file systemd
echo "Creating systemd service file at $SYSTEMD_FILE..."

sudo bash -c "cat > $SYSTEMD_FILE" <<EOL
[Unit]
Description=$DESCRIPTION
After=network.target

[Service]
Type=simple
ExecStart=$EXEC_START
Restart=on-failure
User=root

[Install]
WantedBy=multi-user.target
EOL

# Set permission untuk Svc
sudo chmod 644 $SYSTEMD_FILE

# Reload Svc
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Enable Svc untuk dijalankan saat boot
echo "Enabling $SERVICE_NAME service..."
sudo systemctl enable $SERVICE_NAME

echo "Systemd service $SERVICE_NAME has been created and enabled."