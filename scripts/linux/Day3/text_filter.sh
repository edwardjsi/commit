#!/bin/bash
# text_filter.sh — Demonstrates grep, sed, and awk for log processing

LOGFILE="sample.log"

# 1. Extract lines containing "ERROR"
echo "🔍 Extracting ERROR lines:"
grep "ERROR" sample.log

# 2. Remove timestamps using sed (assuming format: [YYYY-MM-DD HH:MM:SS])
echo -e "\n🧹 Removing timestamps:"
# sed 's/^\[[0-9\-:\ ]*\] //' sample.log
sed 's/^\[[0-9 :\\-]*\] //' sample.log

# 3. Extract IP addresses using grep + regex
echo -e "\n🌐 Extracting IP addresses:"
grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' sample.log

# 4. Count log levels using awk
echo -e "\n📊 Counting log levels:"
awk '{count[$3]++} END {for (level in count) print level, count[level]}' sample.log

# 5. Replace "WARN" with "WARNING" using sed
echo -e "\n✏️ Replacing WARN with WARNING:"
sed 's/\bWARN\b/WARNING/g' sample.log

# 6. Replace "INFO" with "INFORMATION" using sed
echo -e "\n✏️ Replacing WARN with WARNING:"
sed 's/\bINFO\b/INFORMATION/g' sample.log

