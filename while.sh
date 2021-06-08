#!/bin/bash

i=1
while [ "$i" -lt "1000" ]
do
    echo "i is ${i}"
    i=`expr ${i} \* 2`
done
echo "Finished because i is now ${i}"
