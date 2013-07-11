#while true; do
#	xsetroot -name "$( date +"%F %R" )"
#	sleep 60 # Update every minute
#done &
conky | while read -r; do xsetroot -name "$REPLY"; done &
xscreensaver -no-splash &
eval `cat ~/.fehbg` &
trayer --transparent true --widthtype request --expand false --align right &
exec ck-launch-session /usr/local/bin/startdwm
