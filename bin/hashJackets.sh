#!/bin/bash
while IFS= read -r line; do
    file="./jackets/${line}-jacket.png"
    if [[ ! -f $file ]]; then
        echo "$file not found"
    else
        bash ./bin/hash.sh "$file"
    fi
done < all_songs.txt