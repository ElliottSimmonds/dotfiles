#!/bin/sh
set -e

# device names are specific to my system
ORIENTATION=$(xrandr --verbose | grep "LVDS-1" | awk '{print $6}')

# echo "Current orientation: $ORIENTATION"

# these values may not work on all devices, but they work for mine
MATRIX_NORMAL="1 0 0 0 1 0 0 0 1"
MATRIX_LEFT="-1 0 1 0 -1 1 0 0 1"
MATRIX_INVERTED="1 0 0 0 1 0 0 0 1"
MATRIX_RIGHT="-1 0 1 0 -1 1 0 0 1"

rotate_screen() {
    local rotation=$1
    local matrix=$2

    xrandr -o $rotation
    sleep 0.8
    xinput set-prop "Wacom ISDv4 E6 Finger touch" "Coordinate Transformation Matrix" $matrix
    xinput set-prop "Wacom ISDv4 E6 Pen stylus" "Coordinate Transformation Matrix" $matrix
}

case "$ORIENTATION" in
    normal)
        rotate_screen inverted "$MATRIX_INVERTED"
        ;;
    left)
        rotate_screen right "$MATRIX_RIGHT"
        ;;
    right)
        rotate_screen left "$MATRIX_LEFT"
        ;;
    inverted|*)
        rotate_screen normal "$MATRIX_NORMAL"
        ;;
esac
