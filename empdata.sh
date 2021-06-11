#!/bin/bash

# Employee Data
Dave_Fullname="Dave Smith"
Dave_Country="USA"
Dave_Email="dave@example.com"

Jim_Fullname="Jim Jones"
Jim_Country="Germany"
Jim_Email="jim@example.com"

Bob_Fullname="Bob Bobbit"
Bob_Country="France"
Bob_Email="bob@example.com"

echo "Select an Employee: "
select Employee in Dave Jim Bob
do
    echo "What do you want to know about ${Employee}?"
    select Data in Fullname Country Email
    do
        echo $Employee
        echo $Data
        empdata=${Employee}_${Data}
        echo "${Employee}'s ${Data} is ${!empdata}"
        break
    done
    break
done
