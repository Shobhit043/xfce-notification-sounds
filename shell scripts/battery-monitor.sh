#!/bin/bash

common_path="/usr/share/sounds/freedesktop/stereo/"

# Paths to your sound files
FULL_CHARGE_SOUND="$common_path"complete.oga
LOW_BATTERY_SOUND="$common_path"battery-is-completely-dead.mp3

# Function to check battery status
check_battery_status() {
  local status=$(acpi -b | grep -oP '(?<=: )\w+')
  echo $status
}

# Function to check battery percentage
check_battery_percentage() {
  local percentage=$(acpi -b | grep -oP '\d+(?=%)')
  echo $percentage
}

# Initial battery status
last_status=$(check_battery_status)

# Flags to prevent repeating alerts
low_battery_alert_given=false
full_battery_alert_given=false

while true; do
  current_status=$(check_battery_status)
  current_percentage=$(check_battery_percentage)

  if [ "$current_percentage" -ge 80 ] && [ "$current_status" == "Charging" ] && [ "$full_battery_alert_given" = false ]; then
    paplay "$FULL_CHARGE_SOUND"
    notify-send "Battery Almost Full" "Battery is at $current_percentage%. Consider unplugging your charger." -i battery-full-symbol
  fi

  if [ "$current_percentage" -le 30 ] && [ "$current_status" == "Discharging" ] && [ "$low_battery_alert_given" = false ]; then
    paplay "$LOW_BATTERY_SOUND"
    notify-send "Low Battery" "Battery level is at $current_percentage%. Please plug in your charger." -i battery-caution-symbol
  fi

  sleep 300  # Sleep for 10 seconds before the next check
done
