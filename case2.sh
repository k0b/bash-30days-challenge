#!/bin/bash

read -p "which city are you closes to? : " city
case $city in
    "Washington"|London|Paris|Tokyo)
        # You can identify the capital cities and still fall through to 
        # match the specific country below.
        echo "That is a capital city" ;;&

    Chicago|Detroit|"New York"|Washington)
        echo "You are in USA." ;;
    London|Edinburgh|Cardiff|Belfast)
        echo "You are in UK." ;;
    "Ramsey Street")
        # This is a famous street in an unspecified location in Australia
        # You can still fall through and run the generic Australian code
        # by using the ;& ending.
        echo "G'Day Neighbour!" ;&
    Melbourne|Canberra|Sydney)
        echo "You are in Australia." ;;
    Paris)
        echo "You are in France." ;;
    Tokyo)
        echo "You are in Japan." ;;
    N*)
        # We have already matched New Yorkk and ended it with a ;;
        # so New York will not fall through to this test. Other places
        # beginning with N will fall through to here.
        echo "Your word begins with N but is not New York." ;;
    *)
        echo "I'm sorry, I don't know anything about $city" ;;
esac
