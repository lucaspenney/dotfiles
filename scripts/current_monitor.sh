if [ "$(xrandr | grep -c "*HDMI* connected")" -ge 1 ]; then
  MONITOR=$(xrandr | grep "*HDMI* connected" | cut -d' ' -f1)
else
  MONITOR=$(xrandr | grep " connected" | cut -d' ' -f1)
fi
echo $MONITOR
