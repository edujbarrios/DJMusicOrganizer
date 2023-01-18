#!/bin/bash

source_dir="path/to/original/directory"
target_dir="path/to/music/dj/sets"

find "$source_dir" -type f \( -iname "*.mp3" -o -iname "*.wav" \) -exec mv -v {} "$target_dir" \;
