# Show ERROR lines with 2 lines before and after
grep -C2 "ERROR" sample.log

# Show lines NOT containing DEBUG
grep -v "DEBUG" sample.log

# Remove IP addresses
sed -E 's/from ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)//' sample.log

# Replace "WARN" with "WARNING" and "INFO" with "INFORMATION"
sed -e 's/\bWARN\b/WARNING/g' -e 's/\bINFO\b/INFORMATION/g' sample.log

# Count log levels
awk '{count[$3]++} END {for (level in count) print level, count[level]}' sample.log

# Extract timestamp and log level only
awk '{print $1, $2, $3}' sample.log

# Show top 5 most frequent messages
awk '{msg=$4" "$5" "$6" "$7; count[msg]++} END {for (m in count) print count[m], m}' sample.log | sort -nr | head -5
