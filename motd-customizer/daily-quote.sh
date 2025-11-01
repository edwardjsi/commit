#!/bin/bash

#QUOTE_FILE="/etc/update-motd.d/quotes.txt"
#QUOTE_FILE="$(dirname "$0")/quotes.txt"
#NUM_QUOTES=$(wc -l < "$QUOTE_FILE")
#DAY_INDEX=$(( $(date +%j) % NUM_QUOTES + 1 ))
#QUOTE=$(sed -n "${DAY_INDEX}p" "$QUOTE_FILE")
#echo "💬 $QUOTE"

#!/bin/bash

#QUOTE_FILE="/etc/update-motd.d/quotes.txt"
#NUM_QUOTES=$(wc -l < "$QUOTE_FILE")
#RAND_INDEX=$(( RANDOM % NUM_QUOTES + 1 ))
#QUOTE=$(sed -n "${RAND_INDEX}p" "$QUOTE_FILE")

#echo "💬 $QUOTE"

#!/bin/bash

QUOTE_FILE="/etc/update-motd.d/quotes.txt"
#USED_FILE="/etc/update-motd.d/quotes-used.txt"

USED_FILE="/var/tmp/quotes-used.txt"

# Create used file if it doesn't exist
touch "$USED_FILE"

# Total quotes
NUM_QUOTES=$(wc -l < "$QUOTE_FILE")

# Get list of unused line numbers
UNUSED=$(comm -23 <(seq 1 "$NUM_QUOTES" | sort) <(sort "$USED_FILE"))


# If all quotes used, reset
if [ -z "$UNUSED" ]; then
  > "$USED_FILE"
  UNUSED=$(seq 1 "$NUM_QUOTES")
fi

# Pick a random unused quote
RAND_INDEX=$(echo "$UNUSED" | shuf -n 1)
QUOTE=$(sed -n "${RAND_INDEX}p" "$QUOTE_FILE")

# Record usage
echo "$RAND_INDEX" >> "$USED_FILE"

# Display
echo "💬 $QUOTE"
