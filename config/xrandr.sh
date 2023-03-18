#!/bin/sh
xrandr --output DVI-I-1 --off --output VGA-0 \
  --mode 1440x900 --pos 1440x0 --rotate normal \
  --output DVI-I-0 --primary --mode 1440x900 --pos 0x0 \
  --rotate normal --output HDMI-0 --off
