#!/bin/bash

keys=("C" "C#" "D" "D#" "E" "F" "F#" "G" "G#" "A" "A#" "B")

for key in "${keys[@]}"
do
    mkdir -p "music_directory/$key"
done
