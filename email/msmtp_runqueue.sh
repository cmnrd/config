#!/bin/sh

STATE=`nmcli networking connectivity`

if [[ $STATE = 'full' || $STATE = 'limited' ]]
then
    /usr/local/bin/msmtp-runqueue.sh
    exit 0
fi
echo "No internet connection."
exit 0
