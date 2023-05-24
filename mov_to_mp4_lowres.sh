#!/bin/bash

# Check if any .mov files exist in the directory
shopt -s nullglob
mov_files=( *.mov )
shopt -u nullglob

# If no .mov files found, display a warning and exit
if [ ${#mov_files[@]} -eq 0 ]; then
  echo "No .mov files found in the directory."
  exit 1
fi

# Iterate over each .mov file and convert to a lighter .mp4
for file in "${mov_files[@]}"; do
  output="${file%.mov}_light.mp4"
  ffmpeg -i "$file" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k "$output"
done

