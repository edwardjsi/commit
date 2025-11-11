📘 Day 6: Linux Job Scheduling — Cron, Backup Automation, and  Troubleshooting
🎯 Objective
Automate real-world tasks using Linux job scheduling tools:
• 	Use  for recurring jobs
• 	Build a timestamped backup script
• 	Attempt one-time scheduling with 
• 	Document system limitations and fallback strategies

🛠️ What I Built
✅ 1.  — Modular Backup Script

#!/bin/bash

SOURCE="$HOME/commit/Day5"
DEST="$HOME/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG="$HOME/commit/Day6/backup.log"

mkdir -p "$DEST"
tar -czf "$DEST/day5_backup_$TIMESTAMP.tar.gz" "$SOURCE"
echo "Backup created at $TIMESTAMP" >> "$LOG"

- Compresses Day5 folder into a .tar.gz archive
- Stores backups in ~/backups
- Logs each run with a timestamp

✅ 2. Scheduled with

crontab -e

*/5 * * * * ~/commit/Day6/backup.sh

- Runs every 5 minutes
- Verified execution with ls ~/backups and cat backup.log

✅ 3. Attempted One-Time Job with at
Tried:
sudo apt-get update
sudo apt-get install at
sudo systemctl start atd


But received:
Failed to start atd.service: Unit atd.service not found.


🧠 This indicates atd is unavailable in my current environment. I documented the limitation and pivoted to using cron and sleep as alternatives.


