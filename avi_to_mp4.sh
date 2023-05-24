#!/bin/bash
for file in *.avi; do
  filename="${file%.*}"
  ffmpeg -i "$file" "${filename}.mp4"
done

if [[ $(ls *.avi 2>/dev/null | wc -l) -eq 0 ]]; then
    echo "No .avi files found for conversion."
fi
