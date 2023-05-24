#!/bin/bash

# Check if any .avi files exist in the directory
shopt -s nullglob
avi_files=( *.avi )
shopt -u nullglob

# If no .avi files found, display a warning and exit
if [ ${#avi_files[@]} -eq 0 ]; then
  echo "No .avi files found in the directory."
  exit 1
fi

# Iterate over each .avi file and convert to a lighter .mp4
for file in "${avi_files[@]}"; do
  output="${file%.avi}_light.mp4"
  ffmpeg -i "$file" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k "$output"
done

