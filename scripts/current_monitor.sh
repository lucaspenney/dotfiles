if [ "$(xrandr | grep -c HDMI)" -ge 1 ]; then
  MONITOR=$(xrandr | grep HDMI | cut -d' ' -f1)
else
  MONITOR=$(xrandr | grep " connected" | cut -d' ' -f1)
fi
echo $MONITOR
