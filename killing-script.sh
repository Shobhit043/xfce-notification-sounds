#!/bin/bash

# List of script names to kill
SCRIPTS=("battery_monitor" "volume_notify")

for SCRIPT in "${SCRIPTS[@]}"; do
  # Kill the processes directly without checking
  pkill -f "$SCRIPT"
#  echo "Killed all instances of $SCRIPT"
done

