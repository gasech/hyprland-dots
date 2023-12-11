#!/bin/bash

eww update open_right_dock=false

sleep 0.4

color=$(hyprpicker)

if [[ $color == "" ]]; then
  echo Selection canceled
  exit 0
fi

convert -size 50x50 xc:$color /tmp/xcolor.png

notify-send -i "/tmp/xcolor.png" --app-name="Color Picker" $color

wl-copy $color
