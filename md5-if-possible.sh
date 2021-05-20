#!/bin/bash

filename=${1:-/etc/hosts}

if [ -r "$filename" ] && [ -s "$filename" ]; then
    md5sum $filename
else
    echo "$filename can not be processed"
fi
