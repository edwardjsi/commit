📁 Day 3: Advanced Linux Text Processing — grep, sed, awk

🧭 Overview

This module demonstrates how to use three powerful Linux command-line tools — grep, sed, and awk — to process and analyze log files. These tools are essential for DevOps engineers who need to extract insights, automate monitoring, and troubleshoot systems efficiently.

✅ Script: text_filter.sh
📄 Sample Input: sample.log (included for testing)

Tools Used

| grep 	| Searches for specific patterns or keywords  | 
| sed 	| Edits and transforms text streams (e.g., substitution, deletion) | 
| awk 	| Parses structured text and performs field-level operations | 

📜 Script Capabilities

The script performs the following operations:

- Extracts error lines using grep to locate all log entries containing "ERROR".
- Removes timestamps from each log line using sed, simplifying the output.
- Extracts IP addresses using grep with regex to isolate network data.
- Counts log levels using awk to summarize how many INFO, ERROR, or WARN entries exist.
- Replaces log level labels using sed to standardize terminology (e.g., WARN → WARNING).

🧪 Sample Log Input

[2025-11-02 12:00:01] INFO User login from 192.168.1.10
[2025-11-02 12:01:15] ERROR Failed to connect to database
[2025-11-02 12:02:30] WARN Disk usage at 85%
[2025-11-02 12:03:45] INFO Scheduled job completed

📁 File Structure
/scripts/linux/
├── text_filter.sh       # Main script
└── sample.log           # Sample input file for testing







