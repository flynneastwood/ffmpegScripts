#!/bin/bash

# Check if there are any .mp4 files in the directory
shopt -s nullglob
files=(*.mp4)
if [ ${#files[@]} -eq 0 ]; then
  echo "No .mp4 files found."
  exit 1
fi

# Convert .mp4 files to .h265
for file in "${files[@]}"; do
  output="${file%.mp4}.h265"
  ffmpeg -i "$file" -c:v libx265 "$output"
done

echo "Conversion completed."

