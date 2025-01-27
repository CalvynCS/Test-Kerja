#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <start|stop|status> <service_name>"
    exit 1
fi

ACTION=$1
SERVICE_NAME=$2

#Option Start Svc
start_service() {
    echo "Starting $SERVICE_NAME..."
    sudo systemctl start "$SERVICE_NAME"
    if [ $? -eq 0 ]; then
        echo "$SERVICE_NAME started successfully."
    else
        echo "Failed to start $SERVICE_NAME."
    fi
}

#Option Stop Svc
stop_service() {
    echo "Stopping $SERVICE_NAME..."
    sudo systemctl stop "$SERVICE_NAME"
    if [ $? -eq 0 ]; then
        echo "$SERVICE_NAME stopped successfully."
    else
        echo "Failed to stop $SERVICE_NAME."
    fi
}

#Option Check Status Svc
check_status() {
    echo "Checking status of $SERVICE_NAME..."
    sudo systemctl status "$SERVICE_NAME"
}

case $ACTION in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    status)
        check_status
        ;;
    *)
        echo "Invalid action. Use start, stop, or status."
        exit 1
        ;;
esac