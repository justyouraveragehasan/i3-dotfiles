#!/bin/bash

# Function to check if either battery is below 90%
is_battery_below_90() {
    for battery in /sys/class/power_supply/BAT*; do
        capacity=$(cat "$battery/capacity")
        if [ "$capacity" -lt 90 ]; then
            return 0  # true
        fi
    done
    return 1  # false
}


while true; do
    if is_battery_below_90; then
        xset s off -dpms
    else
        xset s on +dpms
    fi
    sleep 60
done
