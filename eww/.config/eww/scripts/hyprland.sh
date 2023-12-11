#!/usr/bin/env bash

current_window() {
  title=$(hyprctl activewindow -j | jq -r '"\(.class) - \(.title)"')

  max_length=45
  truncated_result=$(echo "$title" | cut -c1-$max_length)  
  if [[ $truncated_result == "null - null" ]]; then
    echo "Desktop" 
  else 
    echo "$truncated_result"
  fi
}

print_json() {
  echo "{\"workspaces\": $(hyprctl workspaces -j | jq -c 'sort_by(.id)'), \"active\": $(hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'), \"current_window\": \"$(current_window)\"}"
}

socat -U - UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do print_json "$line"; done
