#!/bin/bash

# String comparison test

if [ "$1" = "$2" ]; then
    echo "$1 is the same as $2"
else
    echo "$1 is not the same as $2"

    # Since the are different, let's see which comes fist.
    if [[ "$1" < "$2" ]]; then
        echo "$1 comes before $2"
    else
        echo "$1 comes after $2"
    fi
fi
