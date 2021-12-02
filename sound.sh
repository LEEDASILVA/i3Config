#!/bin/bash
# Author: Serg Kolo
# Date: June 17,2015
# Description:  this script detects changes in
# the powering method, and does something user
# specifies in appropriate field

on_ac_power
PREVIOUS=$(echo $?)

while [ 1 ]; do
    # check if we're on ac power or not
    on_ac_power
    CURRENT=$(echo $?)
    # check if previous values are current
    # are different. If they are
    # raise the flag.
    if [ $CURRENT -ne $PREVIOUS ]; then
        echo things changed
        play /home/lee/.config/i3/turtle-mating.mp3
        echo running custom stuff

        # when done: make current value previous
        # for future comparison
        PREVIOUS=$(echo $CURRENT )
    else
        # if previous values and current are same
        # it means we didn't switch from battery to
        # ac or vice versa; do nothing
        continue
    fi

    sleep 1
done