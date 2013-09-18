Show or Open (Shell)
============
Shell script for switch to window or execute command (for open new).


#### Dependencies

 - xdotool
 - wmctrl

#### Usage

	# Switch to window gajim (message window better)
	./show-or-open gajim
	# switch to urxvt or run urxvt with tmux
	./show-or-open urxvt -c tmux attach
