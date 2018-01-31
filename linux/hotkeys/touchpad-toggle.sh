#!/bin/bash
synclient TouchpadOff=$(synclient -l | grep -c "TouchpadOff.*=.*0")
if [ 1 = $(synclient -l | grep -c "TouchpadOff.*=.*0") ]
then
  notify-send "Panel dotykowy włączony"
  echo 1 > /var/tmp/touchpad
else
  notify-send "Panel dotykowy wyłączony"
  echo 0 > /var/tmp/touchpad
fi

