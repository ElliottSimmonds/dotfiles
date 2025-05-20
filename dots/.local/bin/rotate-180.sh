#!/bin/sh

ORIENTATION=$(xrandr --verbose | grep "LVDS-1" | sed "s/primary //" | awk '{print $5}')

echo "$ORIENTATION"

# rotate screen by 180 degrees
# sleeps ensure xinput command is applied
if [[ "$ORIENTATION" == *"normal"* ]]; then
    xrandr -o inverted
    xinput set-prop "Wacom ISDv4 E6 Finger touch" "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
elif [[ "$ORIENTATION" == *"left"* ]]; then
    xrandr -o right
    sleep 1
    xinput set-prop "Wacom ISDv4 E6 Finger touch" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
elif [[ "$ORIENTATION" == *"right"* ]]; then
    xrandr -o left
    sleep 1
    xinput set-prop "Wacom ISDv4 E6 Finger touch" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
else 
    xrandr -o normal
    xinput set-prop "Wacom ISDv4 E6 Finger touch" "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
fi
