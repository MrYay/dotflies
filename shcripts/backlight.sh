#!/bin/bash
#http://tech.x4343.org/posts/2014/12/some-i3wm-settings/
if [ "$1" == "down" ]
then
	light -U 1
	TEXT="backlight- $(light)"
elif [ "$1" == "up" ]
then
	light -A 1
	TEXT="backlight+ $(light)"
else
	echo "Usage: $0 [down | up]\n"
fi

ID=$(cat /home/funky/.config/dunst/.dunst_backlight)
if [ $ID -gt "0" ]
then
	dunstify -u low -p -r $ID $TEXT > /home/funky/.config/dunst/.dunst_backlight
else
	dunstify -u low -p $TEXT > /home/funky/.config/dunst/.dunst_backlight
fi
