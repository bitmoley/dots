#!/bin/sh

while true; do
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{
      m = ($3 == "[MUTED]") ? " muted" : ""
      printf "%.0f%%%s", $2 * 100, m
    }')
    capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    datetime=$(date +'%H:%M')
    echo "vol $vol  bat ${capacity}%  $datetime  "
    echo "VOL: $vol  BAT: ${capacity}%  $datetime "
    sleep 1
done
