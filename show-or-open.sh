#!/bin/sh
#set -xv
# Give $1 as program name and $2... as agruments

activate() {
	for PID in $(pidof $1)
	do
		if [ $1 == "gvim" ]
		then # window fix :(
			PID=$(wmctrl -lp | grep GVIM | awk '{print $3}' | tac | head -n 1)
		fi

		if [ $PID ]
		then
			WIN_ID=$(wmctrl -lp | awk "\$3==$PID {print \$1}" | head -n 1)
		else
			WIN_ID=""
		fi
		if [ $WIN_ID ]
		then
			xdotool windowactivate $WIN_ID
			return 0
		fi
	done
	if [ $1 == "gajim" ]
	then
		PID=$(wmctrl -lpx | awk '$4=="gajim.Gajim" {print $3}' | head -n 1)
		if [ ! -z "$PID" ]
		then
			WIN_ID=$(wmctrl -lp | awk "\$3==$PID {print \$1}" | tac | head -n 1)
			xdotool windowactivate $WIN_ID
			return 0
		fi
	fi
	return 1
}
activate "$1" || ($* & (sleep 0.5; activate "$1" || (sleep 1; activate "$1")))
