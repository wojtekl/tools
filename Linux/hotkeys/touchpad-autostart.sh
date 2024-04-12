#!/bin/bash
if [ 0 = $(cat /var/tmp/touchpad) ]
then
  synclient TouchpadOff=1
fi

