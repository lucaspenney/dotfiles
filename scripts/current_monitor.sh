if [ "$(xrandr | grep -c "*HDMI* connected")" -ge 1 ]; then
	export MONITOR=$(xrandr | grep "*HDMI* connected" | cut -d' ' -f1)
else
	export MONITOR=$(xrandr | grep " connected" | cut -d' ' -f1)
fi
