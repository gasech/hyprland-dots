#!/usr/bin/env bash

window_class() {
  echo `hyprctl activewindow -j | jq --raw-output .class`
}

window_title() {
  class=$(window_class)
  title=$(hyprctl activewindow -j | jq --raw-output .title)
  max_length=45
  truncated_result=$(echo "$class - $title" | cut -c1-$max_length)  
  if [[ $class == "null" ]]; then
    echo "Desktop" 
  else 
    echo "$truncated_result"
  fi
}

workspaces() {
  echo "{ \"workspaces\": $(hyprctl workspaces -j | jq -c 'sort_by(.id)'), \"active\": $(hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id')}"
}

if [[ $1 == 'workspaces' ]]; then 
  workspaces

  socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    workspaces
  done
fi

if [[ $1 == 'window' ]]; then 
  window_title

  socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    window_title
  done
fi
