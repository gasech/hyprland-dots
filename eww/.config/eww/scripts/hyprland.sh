#!/usr/bin/env bash

get_icon_by_class_name() {
  class=$(hyprctl activewindow -j | jq -r '.class')

  if [[ $class == "firefox" ]]; then
    echo ""
  elif [[ $class == "kitty" ]]; then
    echo ""
  elif [[ $class == "Spotify" ]]; then
    echo ""
  elif [[ $class == "thunar" ]]; then
    echo ""
  elif [[ $class == "VencordDesktop" ]]; then
    echo "󰙯"
  else
    echo ""
  fi
}

current_window() {
  title=$(hyprctl activewindow -j | jq -r '.title')

  max_length=40
  truncated_result=$(echo "$title" | cut -c1-$max_length)  
  if [[ $truncated_result == "null" ]]; then
    echo "Desktop" 
  else 
    echo "$truncated_result"
  fi
}

print_json() {
  echo "{\"workspaces\": $(hyprctl workspaces -j | jq -c 'sort_by(.id)'), \"active\": $(hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'), \"current_window\": \"$(current_window)\", \"window_icon\": \"$(get_icon_by_class_name)\"}"
}

socat -U - UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do print_json "$line"; done
