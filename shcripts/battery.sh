#!/bin/bash
# https://gist.github.com/xero/6ea24cb35ad2638e1d59

BATPATH=/sys/class/power_supply/BAT0
BAT_FULL=$BATPATH/charge_full
BAT_NOW=$BATPATH/charge_now
BAT_STATUS=$BATPATH/status
bf=$(cat $BAT_FULL)
bn=$(cat $BAT_NOW)
if [ $(( 100 * $bn / $bf )) -le 15 ] && [ $(cat "$BAT_STATUS") == "Discharging" ];
then
	notify-send -u critical "FEED ME :(" $(acpi | cut -d' ' -f4 | tr -d ',')
fi
