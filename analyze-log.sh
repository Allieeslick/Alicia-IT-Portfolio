#!/bin/bash
LOGFILE=$1
if [ -z "$LOGFILE" ]; then
echo "Usage: bash analyze-log.sh <logfile>"
exit 1
fi
if [ ! -f "$LOGFILE" ]; then
echo "Error: File not found."
exit 1
fi
grep -i "failed" "$LOGFILE"  > failed-auth.txt
grep -i "denied" "$LOGFILE" >> failed-auth.txt
COUNT=$(wc -l < failed-auth.txt)
echo "Suspicious events found: $COUNT"
echo "Results saved to: failed-auth.txt"
