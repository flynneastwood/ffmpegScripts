#!/bin/bash

for file in *.mov; do
    output="${file%.mov}.mp4"
    ffmpeg -i "$file" "$output"
done

if [[ $(ls *.mov 2>/dev/null | wc -l) -eq 0 ]]; then
    echo "No .mov files found for conversion."
fi

