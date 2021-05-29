#!/bin/bash

read -p "Enter the starting value for a : " a
read -p "Enter the starting value for b : " b

while [ $a -le 12 ] && [ $b -ge 100 ]
do
    echo "a is ${a}; b is ${b}."
    let a=$a+1
    let b=$b-10
done

