#!/bin/sh
#
# This script will make use of the ESX vscsiStats utility to collect
# IO to every vmdk specified on the ESX host this script is running.
# The data is written to a txt file that can then be parsed for analysis.
#
# The counters start incrementing from the enable or start switch (-s) and will
# end with the stop switch (-x).
# Depending on the type of analysis that needs to be done, collecting many "snapshots"
# might not be necessary.
#
# In this default setup, we have 24 collections of 6 snapshots every pollrate of 600 seconds (10 minutes)
# and each collection is for 1 hour (count = 6).
# We now reset the counters after each poll or snapshot and no longer at the end of the collection.
#
# If the Seconds are changed, then will have to make changes to the different loop values
# as this is a very basic shell, don't have advanced features.
#
# ESXi bash does not support functions therefore putting all commands in the trap line.
#
# ver 1.5.1
#
EXT=".txt"
POLLRATE=600
HOSTNAME=$(uname -n)
STARTDT=$(date +"%Y%m%d_%H%M%S")
NOW=$STARTDT
mkdir $STARTDT

trap '{ echo "Terminated." ; NOW=$(date +"%Y%m%d_%H%M%S"); vscsiStats -p all > $STARTDT/vstats-$HOSTNAME-$NOW-shutdown$EXT ; vscsiStats -l > $STARTDT/vstats-$HOSTNAME-$NOW-config-last$EXT ; vscsiStats -x ; exit 1; }' SIGTERM
trap '{ echo "Interrupted." ; NOW=$(date +"%Y%m%d_%H%M%S"); vscsiStats -p all > $STARTDT/vstats-$HOSTNAME-$NOW-shutdown$EXT ; vscsiStats -l > $STARTDT/vstats-$HOSTNAME-$NOW-config-last$EXT ; vscsiStats -x ; exit 1; }' SIGINT

echo "#vstats-init-start" > $STARTDT/vstats-$HOSTNAME-$NOW-config-first$EXT
echo "vstat-hostname:$HOSTNAME" >> $STARTDT/vstats-$HOSTNAME-$NOW-config-first$EXT
echo "vstat-pollrate:$POLLRATE" >> $STARTDT/vstats-$HOSTNAME-$NOW-config-first$EXT
echo "vstat-date:$NOW" >> $STARTDT/vstats-$HOSTNAME-$NOW-config-first$EXT
echo "#vstats-init-end" >> $STARTDT/vstats-$HOSTNAME-$NOW-config-first$EXT
#
# Get the VM names, ID and vdisk ID to scsi number.
# Save to config start file, will collect one at the end as well.
#
vscsiStats -l >> $STARTDT/vstats-$HOSTNAME-$NOW-config-first$EXT

#
# First loop is the number of collections, by default they represent hours if the poll rate is 600 seconds and the poll count is 6.
# Second loop is the number of polls in each collection.  To maintain the collection per hour, then the poll rate x maxcount must = 1 hour.
#
for COLLECTION  in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
   #
   # The '&' after the sleep and wait are to allow the TERM signal to interupt the sleep.
   #
   for COUNT  in 1 2 3 4 5 6
   do
        # Start the vstats on all worlds
        vscsiStats -s

        sleep $POLLRATE &
        wait

        NOW=$(date +"%Y%m%d_%H%M%S")
        vscsiStats -p all > $STARTDT/vstats-$HOSTNAME-$NOW$EXT

        # Reset counters
        vscsiStats -x
   done
done

#
# One last config check (do we have the same VMs when we started)
#
NOW=$(date +"%Y%m%d_%H%M%S")
vscsiStats -l > $STARTDT/vstats-$HOSTNAME-$NOW-config-last$EXT
