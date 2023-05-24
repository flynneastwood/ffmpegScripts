#!/bin/bash

for file in *.mkv; do
    output="${file%.mkv}.mp4"
    ffmpeg -i "$file" "$output"
done

if [[ $(ls *.mkv 2>/dev/null | wc -l) -eq 0 ]]; then
    echo "No .mkv files found for conversion."
fi

