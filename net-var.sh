#!/bin/bash

. /etc/sysconfig/network-scripts/ifcfg-enp0s31f6

for E in UUID ONBOOT DEVICE
do
    echo "The $E is ${!E}"
done
