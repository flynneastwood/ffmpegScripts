#!/bin/bash

for file in *.wav; do
    output="${file%.wav}.mp3"
    ffmpeg -i "$file" "$output"
done

if [[ $(ls *.wav 2>/dev/null | wc -l) -eq 0 ]]; then
    echo "No .wav files found for conversion."
fi

