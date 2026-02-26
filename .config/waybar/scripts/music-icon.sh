#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    echo '{"text":"","class":"playing"}'
elif [ "$status" = "Paused" ]; then
    echo '{"text":"󰏤","class":"paused"}'
else
    echo '{"text":""}'
fi
