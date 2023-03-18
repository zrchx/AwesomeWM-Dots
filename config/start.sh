#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

# Compositor #
run picom --experimental-backends
# Screen config #
run sh ~/.config/awesome/config/xrandr.sh
