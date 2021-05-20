#!/bin/bash

echo "The IFS before change is ${IFS}"

oIFS=$IFS
IFS=":"

while read login pass uid gid name home shell
do 
    if [ "$shell" != "/bin/false" ] && [ ! -z "${home%\/var\/*}" ]; then
        echo "User $login ($name) lives in $home and uses `basename $shell`"
    fi
done < /etc/passwd

echo "Current IFS is ${IFS}"

IFS=$oIFS

echo "Changed IFS is ${IFS}"

