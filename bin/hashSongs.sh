#!/bin/bash
while IFS= read -r line; do
    file="./data/${line}.json"
    if [[ ! -f $file ]]; then
        echo "$file not found"
    else
        bash ./bin/hash.sh "$file"
    fi
done < all_songs.txt