#!/bin/bash

genres=("Pop" "Rock" "Hip-Hop" "Jazz" "Blues" "Country" "Classical" "Electronic" "Folk" "Reggaeton" "Salsa" "Soul" "R&B" "Reggae")

for genre in "${genres[@]}"
do
    mkdir -p "music_directory/$genre"
done
