#!/bin/bash

# Find all image files in the current directory
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0 | while IFS= read -r -d $'\0' image; do

  # Use different compression tools based on image format
  case "${image##*.}" in
    jpg|jpeg)
      jpegoptim -m90 "$image" # Lossless JPEG optimization
      ;;
    png)
      optipng -o7 "$image"   # Lossless PNG optimization
      ;;
  esac

done
