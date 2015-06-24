#!/bin/bash
#str=`amixer sget Speaker`
#str1=${str#Simple*\[*\[*\[}
#p1=`echo "$str1" | sed -e :a -e 's/\]//;ta'`

str=`pulseaudio-ctl | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | grep "sink muted"` 
p1=`echo "$str" | sed -r "s/.+ : //g"`

if [[ $p1 == "no" ]]
  then p2="On"
  else p2="Off"
fi
echo "$p2"
