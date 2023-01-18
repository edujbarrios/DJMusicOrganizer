#!/bin/bash

source_dir="path/to/original/directory"
target_dir="path/to/music/dj/sets"

genres=("Pop" "Rock" "Hip-Hop" "Jazz" "Blues" "Country" "Classical" "Electronic" "Folk" "Reggaeton" "Salsa" "Soul" "R&B" "Reggae")
keys=("C" "C#" "D" "D#" "E" "F" "F#" "G" "G#" "A" "A#" "B")

for genre in "${genres[@]}"
do
    for key in "${keys[@]}"
    do
        for bpm in {40..200..10}
        do
            mkdir -p "$target_dir/$genre/$key/$bpm"
        done
    done
done

for file in "$source_dir"/*
do
    if [[ $file == *".mp3" || $file == *".wav" ]]
    then
        genre=$(eyeD3 --no-color "$file" | grep "genre:" | awk '{print $NF}')
        key=$(sox "$file" -n stat 2>&1 | grep "Key:" | awk '{print $NF}')
        bpm=$(sox "$file" -n stat 2>&1 | grep "Tempo:" | awk '{print $NF}')
        if [[ -n $genre && -n $key && -n $bpm ]]
        then
            mv -v "$file" "$target_dir/$genre/$key/$bpm/$(basename "$file")"
        else
            echo "Metadata not found for $file
