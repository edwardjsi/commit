#!/bin/bash
echo "Welcome $(whoami)! Today is $(date '+%A')"
echo "Uptime: $(uptime -p)"
echo "Free Disk: $(df -h ~ | tail -1 | awk '{print $4}')"
echo "MOTD = Your DevOps Dashboard"
