#!/bin/bash

# Get all image files in the current directory, sorted alphabetically
image_files=$(find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0 | sort -z  -V  | tr '\0' ' ')

# Use ImageMagick to convert images to a PDF
convert $image_files "output.pdf"
