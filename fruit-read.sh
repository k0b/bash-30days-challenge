#!/bin/bash

echo -en "Please tell me some of your favourite fruits: "
read fruits

for fruit in $fruits
do
    echo "I really like ${fruit}s"
done
echo "Let's make a salad!"

