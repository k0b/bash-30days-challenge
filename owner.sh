#!/bin/bash

while read -p "What file do you want to test ? " filename
do
    if [ ! -e "$filename" ]; then
        echo "The file does not exist."
        continue
    fi

    # Okay, the file exists.
    ls -ld $filename
    if [ -O "$filename" ]; then
        echo "You own the $filename ."
    else
        echo "You don't own the $filename "
    fi
    if [ -G "$filename" ]; then
        echo "Your group owns the $filename"
    else
        echo "Your group doesn't own the $filename"
    fi
done

