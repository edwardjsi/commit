#!/bin/bash

# Define source and destination
SOURCE="$HOME/commit/Day5"
DEST="$HOME/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG="$HOME/commit/Day6/backup.log"

# Create destination folder if it doesn't exist
mkdir -p "$DEST"

# Create backup
tar -czf "$DEST/day5_backup_$TIMESTAMP.tar.gz" "$SOURCE"

# Log the result
echo "Backup created at $TIMESTAMP" >> "$LOG"
