#!/bin/bash

read -p "What is you favourite fruit? : " fruit
case $fruit in 
    orange) echo "The $fruit is orange" ;;
    banana) echo "The $fruit is yellow" ;;
    pear) echo "The $fruit is green" ;;
    *) echo "I don't know what color a $fruit is" ;;
esac

