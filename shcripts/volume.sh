#!/bin/bash
#http://tech.x4343.org/posts/2014/12/some-i3wm-settings/
if [ "$1" == "down" ]
then
	amixer -q set Master 1%- unmute
	TEXT="Vol- $(amixer sget Master | tail -1 | cut -d' ' -f7 | sed 's/\(\[\|\]\)//g')"
elif [ "$1" == "up" ]
then
	amixer -q set Master 1%+ unmute
	TEXT="Vol+ $(amixer sget Master | tail -1 | cut -d' ' -f7 | sed 's/\(\[\|\]\)//g')"
elif [ "$1" == "mute" ]
then
	amixer -q set Master toggle
	TEXT="Vol $(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')"
else
	echo "Usage: volume [down | up | mute]\n"
fi

ID=$(cat /home/funky/.config/dunst/.dunst_volume)
if [ $ID -gt "0" ]
then
	dunstify -u low -p -r $ID $TEXT > /home/funky/.config/dunst/.dunst_volume
else
	dunstify -u low -p $TEXT > /home/funky/.config/dunst/.dunst_volume
fi
