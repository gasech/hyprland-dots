#!/bin/bash

wallpaper_dir="$HOME/Pictures/wallpapers/"

select_wallpaper() {
  if [ $# -eq 0 ]; then
    file=$(zenity --file-selection --filename "$wallpaper_dir")
  elif [ -f "$1" ]; then
    file_type=$(file -b --mime-type "$1")
    if [[ $file_type == image/* ]]; then
      file=$1
    else
      echo "The first parameter is not an image file."
    fi
  else
    echo "File not found: $1"
    exit 0;
  fi

  ~/.config/eww/scripts/material.py --image "$file" 
}

get_random_wallpaper() {
  if [ ! -d "$wallpaper_dir" ]; then
    echo "Error: Image directory not found."
    exit 1
  fi

  random_image=$(find "$wallpaper_dir" -type f -name '*.jpg' -o -name '*.png' | shuf -n 1)

  if [ -z "$random_image" ]; then
    echo "Error: No images found in the directory."
    exit 1
  fi

  echo "Selected random image: $random_image"

  select_wallpaper "$random_image"
}

[ "$1" = "select" ] && select_wallpaper $2 && exit
[ "$1" = "random" ] && get_random_wallpaper && exit
