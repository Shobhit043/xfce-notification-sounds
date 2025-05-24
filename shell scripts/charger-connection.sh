#!/bin/bash

common_path="/usr/share/sounds/freedesktop/stereo/"

# Paths to your sound files
CHARGER_CONNECTED_SOUND="$common_path"power-plug.oga
CHARGER_REMOVED_SOUND="$common_path"power-unplug.oga

# Function to check battery status
check_battery_status() {
  local status=$(acpi -b | grep -oP '(?<=: )\w+')
  echo $status
}

# Initial battery status
last_status=$(check_battery_status)

while true; do
  current_status=$(check_battery_status)

  if [ "$last_status" != "$current_status" ]; then
    if [ "$current_status" == "Charging" ]; then
      paplay "$CHARGER_CONNECTED_SOUND"
    elif [ "$current_status" == "Discharging" ]; then
      paplay "$CHARGER_REMOVED_SOUND"
    fi
  fi
  
  last_status=$current_status

  sleep 0.5  # Sleep for 0.5 seconds before the next check
done
