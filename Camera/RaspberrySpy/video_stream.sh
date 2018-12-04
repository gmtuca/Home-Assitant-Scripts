#!/bin/bash
SNAPSHOT_LENGTH_MINUTES=1
CLEANUP_OLDER_THAN_MINUTES=5

while true
do 
	raspivid -o "$(date '+%Y-%b-%d-%Hh-%Mm-%Ss').h264" -t $(($SNAPSHOT_LENGTH_MINUTES * 60 * 1000)) -w 640 -h 480 -fps 25
	echo "Snapshot completed at $(date '+%Y-%b-%d-%Hh-%Mm-%Ss')"
	find . -mmin +$(($CLEANUP_OLDER_THAN_MINUTES)) -exec rm {} \;
done