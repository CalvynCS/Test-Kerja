#!/bin/bash

echo "System Information: $(hostnamectl)"
echo "Hostname: $(hostname)"
echo "Current Time: $(date)"
echo "Logged-in Users: $(who | wc -l)"