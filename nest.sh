#!/bin/bash

myfruit=""

while [ "$myfruit" != "quit" ]
do
    for fruit in apples bananas pears $myfruit
    do
        echo "I like $fruit"
    done # end of the for loop
    read -p "What is your favourite fruit ? " myfruit
done
echo "Okay, bye!"
