#!/bin/sh

bat=/sys/class/power_supply/BAT0/
bat_status="$(cat "$bat/status")"
per="$(cat "$bat/capacity")"

icon() {
  if [ "$per" -gt "95" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰂄" || echo "󰁹" )
  elif [ "$per" -gt "90" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰂋" || echo "󰂂" )
  elif [ "$per" -gt "80" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰂊" || echo "󰂁" )
  elif [ "$per" -gt "70" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰢞" || echo "󰂀" )
  elif [ "$per" -gt "60" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰂉" || echo "󰁿" )
  elif [ "$per" -gt "50" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰢝" || echo "󰁾" )
  elif [ "$per" -gt "40" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰂈" || echo "󰁽" )
  elif [ "$per" -gt "30" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰂇" || echo "󰁼" )
  elif [ "$per" -gt "20" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰂆" || echo "󰁻" )
  elif [ "$per" -gt "10" ]; then
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰢜"|| echo "󰁺" )
  else
    icon=$( [[ $bat_status == "Charging" ]] && echo "󰢟" || echo "󰂎" )
  fi
    echo "$icon"
}

percent() {
  echo "$per"
}

echo "{ \"icon\": \"$(icon)\", \"level\": \"$(percent)\" }"

exit
