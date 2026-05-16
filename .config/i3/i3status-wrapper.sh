#!/bin/bash

exec i3status | while read -r line; do
    led=$(xset -q | awk '/LED/ {print $10}')

    if [ "$led" = "00001000" ]; then
        layout="UA"
    else
        layout="US"
    fi

    echo "$layout | $line"
done
