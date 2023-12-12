#!/bin/bash
VALGRIND_PIDS=$(ps -o pid -p $(ps aux | grep valgrind | grep -v grep | awk '{print $2}') | grep -v PID)
COUNT=$(echo "$valgrind_pids" | wc -l)

if [[ $COUNT -eq 1 ]]; then
 echo "$VALGRIND_PIDS"
elif [ $COUNT -gt 1 ]; then
 echo "$COUNT"
fi

