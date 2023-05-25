#!/bin/bash

# Check if there are any .mp4 files in the directory
shopt -s nullglob
files=(*.mp4)
if [ ${#files[@]} -eq 0 ]; then
  echo "No .mp4 files found."
  exit 1
fi

# Convert .mp4 files to .wav (audio-only)
for file in "${files[@]}"; do
  output="${file%.mp4}.wav"
  ffmpeg -i "$file" -vn -acodec pcm_s16le -ar 44100 -ac 2 "$output"
done

echo "Conversion completed."

