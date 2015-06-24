#!/bin/bash
#str=`amixer sget Speaker`
#str1=${str#Simple*\[}
#v1=${str1%%]*]}
#p1=`echo "$v1" | sed -e :a -e 's/^.\{1,3\}$/ &/;ta'`

str=`pulseaudio-ctl | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | grep "Volume"` 
p1=`echo "$str" | sed -r "s/[^0-9]//g"`

echo "$p1%"
