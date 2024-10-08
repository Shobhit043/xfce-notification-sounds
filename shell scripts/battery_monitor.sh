#!/bin/bash

common_path="/your/dir/path"
# Paths to your sound files
CHARGER_CONNECTED_SOUND="$common_path"power-plug.oga
CHARGER_REMOVED_SOUND="$common_path"power-unplug.oga
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

  if [ "$last_status" != "$current_status" ]; then
    if [ "$current_status" == "Charging" ]; then
      paplay "$CHARGER_CONNECTED_SOUND"
      low_battery_alert_given=false  # Reset the low battery alert when charger is connected
    elif [ "$current_status" == "Discharging" ]; then
      paplay "$CHARGER_REMOVED_SOUND"
      full_battery_alert_given=false  # Reset the full battery alert when charger is disconnected
    fi
    last_status=$current_status
  fi

  if [ "$current_percentage" -ge 95 ] && [ "$current_status" == "Charging" ] && [ "$full_battery_alert_given" = false ]; then
    paplay "$FULL_CHARGE_SOUND"
    notify-send "Battery Almost Full" "Battery is at $current_percentage%. Consider unplugging your charger." -i battery-full-symbol
    full_battery_alert_given=true  # Prevent repeating the full battery alert
  fi

  if [ "$current_percentage" -le 20 ] && [ "$current_status" == "Discharging" ] && [ "$low_battery_alert_given" = false ]; then
    paplay "$LOW_BATTERY_SOUND"
    notify-send "Low Battery" "Battery level is at $current_percentage%. Please plug in your charger." -i battery-caution-symbol
    low_battery_alert_given=true  # Prevent repeating the low battery alert
  fi

  sleep 0.5  # Sleep for 0.5 seconds before the next check
done
