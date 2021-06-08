#!/bin/bash

for mce in `wc -l /var/log/mcelog | grep -vw "0 "`
do
    gzip $mce
done
