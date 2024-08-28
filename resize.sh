#!/bin/bash

# Get the desired width from the user
read -p "Enter the desired width (in pixels): " target_width

# Find all image files in the current directory
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0 | while IFS= read -r -d $'\0' image; do

  # Get the original image size
  original_width=$(identify -format "%w" "$image")
  original_height=$(identify -format "%h" "$image")

  # Calculate the new height to maintain aspect ratio
  target_height=$(( original_height * target_width / original_width ))

  # Use ImageMagick to resize the image
  convert "$image" -resize "${target_width}x${target_height}" "${image%.*}.${image##*.}"

done
