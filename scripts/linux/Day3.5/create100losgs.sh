#!/bin/bash
# Generate a 100-line dummy log file

LOGFILE="sample.log"
> "$LOGFILE"  # Clear existing file

for i in {1..100}; do
  TIMESTAMP=$(date -d "$i min ago" "+[%Y-%m-%d %H:%M:%S]")
  LEVEL=$(shuf -n1 -e INFO WARN ERROR DEBUG)
  IP="192.168.$((RANDOM % 255)).$((RANDOM % 255))"
  MESSAGE=$(shuf -n1 -e \
    "User login successful" \
    "Disk usage at 85%" \
    "Failed to connect to database" \
    "Scheduled job completed" \
    "Permission denied for user" \
    "Service restarted" \
    "Timeout while connecting to API" \
    "Configuration file missing" \
    "High memory usage detected" \
    "New user registered")
  echo "$TIMESTAMP $LEVEL $MESSAGE from $IP" >> "$LOGFILE"
done
