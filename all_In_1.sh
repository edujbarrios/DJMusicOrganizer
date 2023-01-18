#!/bin/bash

genres=("Pop" "Rock" "Hip-Hop" "Jazz" "Blues" "Country" "Classical" "Electronic" "Folk" "Reggaeton" "Salsa" "Soul" "R&B" "Reggae")
keys=("C" "C#" "D" "D#" "E" "F" "F#" "G" "G#" "A" "A#" "B")

for genre in "${genres[@]}"
do
    for key in "${keys[@]}"
    do
        for bpm in {40..200..10}
        do
            mkdir -p "music_directory/$genre/$key/$bpm"
        done
    done
done
