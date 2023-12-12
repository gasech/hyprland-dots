#!/bin/bash

~/.config/eww/scripts/material.py --toggle

sleep 1;

current_theme=$(~/.config/eww/scripts/material.py --current)

if [[ $current_theme == "dark" ]]; then
  scss_theme='$background: rgba(255, 255, 255, 0.1);'
else 
  scss_theme='$background: rgba(0, 0, 0, 0.4);'
fi

echo "$scss_theme" > ~/.config/eww/scripts/colors/background.scss
