#!/bin/bash

for file in *.mp4; do
    if [ -e "$file" ]; then
        new_file="${file%.*}_light.mp4"
        ffmpeg -i "$file" -crf 28 "$new_file"
    else
        echo "No .mp4 files found."
    fi
done

