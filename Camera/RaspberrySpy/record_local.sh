#!/bin/bash

#1-hour snapshots
SNAPSHOT_LENGTH_MINUTES=30

#delete snapshots older than 1-day
CLEANUP_OLDER_THAN_MINUTES=1440

echo "Starting recording session at $(date '+%Y-%b-%d-%Hh-%Mm-%Ss')" >> /home/pi/recording.log

while true
do
        raspivid -o "/home/pi/usb/$(date '+%Y-%b-%d-%Hh-%Mm-%Ss').h264" -t $(($SNAPSHOT_LENGTH_MINUTES * 60 * 1000)) -rot$
        test $? -gt 128 && break;
        echo "Snapshot completed at $(date '+%Y-%b-%d-%Hh-%Mm-%Ss')" >> /home/pi/recording.log
        find /home/pi/usb/. -maxdepth 1 -mmin +$(($CLEANUP_OLDER_THAN_MINUTES)) -exec rm {} \;
done
