#!/usr/bin/env bash

# Nerd Font icons for battery
DISCHARGING_ICONS=("󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")
CHARGING_ICONS=("󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅")
NOT_CHARGING_ICON="󰚥"
NO_BATTERY_ICON="󱉝"

BATTERY_LOW=21

# Detect OS and battery
OS="$(uname)"
if [[ "$OS" == "Darwin" ]]; then
  BATTERY_NAME="InternalBattery-0"
elif [[ "$OS" == "Linux" ]]; then
  if [[ -d "/sys/class/power_supply/BAT0" ]]; then
    BATTERY_NAME="BAT0"
  elif [[ -d "/sys/class/power_supply/BAT1" ]]; then
    BATTERY_NAME="BAT1"
  else
    BATTERY_NAME=""
  fi
else
  BATTERY_NAME=""
fi

# Check if battery exists
battery_exists() {
  case "$OS" in
    "Darwin")
      pmset -g batt | grep -q "$BATTERY_NAME"
      ;;
    "Linux")
      [[ -d "/sys/class/power_supply/$BATTERY_NAME" ]]
      ;;
    *)
      return 1
      ;;
  esac
}

if ! battery_exists; then
  echo ""
  exit 0
fi

# Get battery stats
get_battery_stats() {
  case "$OS" in
    "Darwin")
      batt_info=$(pmset -g batt | grep "$BATTERY_NAME")
      perc=$(echo "$batt_info" | grep -Eo '[0-9]+%' | tr -d '%')
      status=$(echo "$batt_info" | awk '{print $3}' | tr -d ';')
      echo "$status $perc"
      ;;
    "Linux")
      if [[ -f "/sys/class/power_supply/$BATTERY_NAME/status" && -f "/sys/class/power_supply/$BATTERY_NAME/capacity" ]]; then
        status=$(<"/sys/class/power_supply/$BATTERY_NAME/status")
        perc=$(<"/sys/class/power_supply/$BATTERY_NAME/capacity")
        echo "$status $perc"
      else
        echo "Unknown 0"
      fi
      ;;
    *)
      echo "Unknown 0"
      ;;
  esac
}

read -r BATTERY_STATUS RAW_PERCENTAGE <<< "$(get_battery_stats)"

# Sanitize %
if ! [[ "$RAW_PERCENTAGE" =~ ^[0-9]+$ ]]; then
  BATTERY_PERCENTAGE=0
else
  BATTERY_PERCENTAGE="$RAW_PERCENTAGE"
fi

# Normalize status (lowercase)
BATTERY_STATUS=$(echo "$BATTERY_STATUS" | tr '[:upper:]' '[:lower:]')

# Default values
ICON="$NO_BATTERY_ICON"
COLOR="#[fg=white]"

# Choose icon and color
case "$BATTERY_STATUS" in
  "charging")
    ICON="${CHARGING_ICONS[$((BATTERY_PERCENTAGE / 10))]}"
    COLOR="#[fg=green,bold]"
    ;;
  "discharging")
    ICON="${DISCHARGING_ICONS[$((BATTERY_PERCENTAGE / 10))]}"
    if (( BATTERY_PERCENTAGE < BATTERY_LOW )); then
      COLOR="#[fg=b4befe]"
    else
      COLOR="#[fg=#b4befe]"
    fi
    ;;
  "full"|"charged"|"ac")
    ICON="$NOT_CHARGING_ICON"
    COLOR="#[fg=#b4befe]"
    ;;
  *)
    # Unknown or not charging
    ICON="$NOT_CHARGING_ICON"
    if (( BATTERY_PERCENTAGE < BATTERY_LOW )); then
      COLOR="#[fg=green]"
    elif (( BATTERY_PERCENTAGE >= 100 )); then
      COLOR="#[fg=#b4befe]"
    else
      COLOR="#[fg=#b4befe]"
    fi
    ;;
esac

RESET="#[default]"

echo -n "${COLOR}${ICON} ${BATTERY_PERCENTAGE}%${RESET}"

